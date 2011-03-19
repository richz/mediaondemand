using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MediaOnDemand;

namespace MediaOnDemand
{
    public partial class OtherVideos : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected string postBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");

                SetList();
                if (this.ddlList.Items.Count > 0)
                    this.ddlList.SelectedIndex = 0;

                if (this.ddlMediaTypes.SelectedValue.Equals("tv"))
                {
                    SetSeasonNumbers();
                    if (ddlSeasonNumbers.Items.Count > 0)
                    {
                        this.ddlSeasonNumbers.SelectedIndex = 0;

                        if (this.lnqVideos.WhereParameters.IndexOf(new Parameter("medAlbum")) < 0)
                            this.lnqVideos.WhereParameters.Add("medAlbum", this.ddlSeasonNumbers.SelectedValue);
                    }
                }

                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvVideos.Sort("medTitle", SortDirection.Ascending);
            }

            //this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
            this.lblFileMessages.Text = "";
        }

        #endregion

        #region Controls Event Handlers

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvVideos.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());
            }
            else
                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);

            this.gvVideos.PageIndex = 0;
        }

        #endregion

        #region Helper Methods

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());

            int iEndRecord = gvVideos.PageSize * (gvVideos.PageIndex + 1);
            int iStartsRecods = iEndRecord - gvVideos.PageSize;

            if (iEndRecord > iTotalRecords)
                iEndRecord = iTotalRecords;

            if (iStartsRecods == 0 || iStartsRecods % gvVideos.PageSize == 0) iStartsRecods += 1;
            if (iEndRecord == 0) iEndRecord = iTotalRecords;

            if (iTotalRecords == 0)
                this.lblRecordCount.Text = "";
            else
                this.lblRecordCount.Text = iStartsRecods + " to " + iEndRecord.ToString() + " of " + iTotalRecords.ToString();

        }

        private void SetList()
        {
            this.ddlList.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue))
                {
                    //DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = sm.medGenre;

                    if (!this.ddlList.Items.Contains(new ListItem(item)))
                        this.ddlList.Items.Add(item);
                }
            }
        }

        private void SetSeasonNumbers()
        {
            this.ddlSeasonNumbers.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue) && sm.medGenre.Trim().Equals(this.ddlList.SelectedValue))
                {
                    //DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = sm.medAlbum;

                    if (!this.ddlSeasonNumbers.Items.Contains(new ListItem(item)))
                        this.ddlSeasonNumbers.Items.Add(item);
                }
            }
        }

        #endregion

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.lnqVideos.WhereParameters.Count > 2)
                this.lnqVideos.WhereParameters.RemoveAt(2);

            // Reset Page Index for Grid
            this.gvVideos.PageIndex = 0;
            this.ddlPageSize.SelectedIndex = 0;
            this.gvVideos.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);

            SetList();
            if (this.ddlList.Items.Count > 0)
                this.ddlList.SelectedIndex = 0;

            if (this.ddlMediaTypes.SelectedValue.Equals("tv"))
            {
                SetSeasonNumbers();
                if (this.ddlSeasonNumbers.Items.Count > 0)
                    this.ddlSeasonNumbers.SelectedIndex = 0;
            }

            switch (this.ddlMediaTypes.SelectedValue)
            {
                case "tv":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"tv\"";                        
                    }
                    break;
                case "sports":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"sports\"";
                    }
                    break;
                case "musicvideo":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"musicvideo\"";
                    }
                    break;
            }

            //if (Convert.ToInt32(Session["TotalRowCount"].ToString()) > 0)
            //{
            //    SetList();                
            //    if(this.ddlList.Items.Count > 0)
            //        this.ddlList.SelectedIndex = 0;

            //    if (this.ddlMediaTypes.SelectedValue.Equals("tv"))
            //    {
            //        SetSeasonNumbers();
            //        if (this.ddlSeasonNumbers.Items.Count > 0)
            //            this.ddlSeasonNumbers.SelectedIndex = 0;
            //    }
            //}
        }

        protected void lnqVideos_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;

                //this.lblChooseMediaType.Visible = false;
                //this.ddlMediaTypes.Visible = false;
                this.lblChooseSeries.Visible = false;
                this.ddlList.Visible = false;
                this.ddlSeasonNumbers.Visible = false;
                this.lblChooseSeason.Visible = false;                
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;

                this.lblChooseMediaType.Visible = true;
                this.ddlMediaTypes.Visible = true;
                this.lblChooseSeries.Visible = true;
                this.ddlList.Visible = true;
                this.ddlSeasonNumbers.Visible = true;
                this.lblChooseSeason.Visible = true;   
            }
        }

        protected void ddlMediaTypes_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            // SetList();
            // if(this.ddlList.Items.Count > 0)
            //   this.ddlList.SelectedIndex = 0;
            //}

        }

        protected void ddlList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlMediaTypes.SelectedValue.Equals("tv"))
            {
                SetSeasonNumbers();
                if (this.ddlSeasonNumbers.Items.Count > 0)
                    this.ddlSeasonNumbers.SelectedIndex = 0;

                this.lnqVideos.WhereParameters["medAlbum"].DefaultValue = this.ddlSeasonNumbers.SelectedValue;
            }
        }

        protected void ddlSeasonNumbers_SelectedIndexChanged(object sender, EventArgs e)
        {

            this.lnqVideos.WhereParameters["medAlbum"].DefaultValue = this.ddlSeasonNumbers.SelectedValue;
        }

        protected void gvVideos_DataBound(object sender, EventArgs e)
        {            

        }
    }
}