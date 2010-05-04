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
            Session["SelectedListIndex"] = this.ddlList.SelectedIndex;

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;

                this.ddlList.SelectedIndex = 0;
                //this.lnqVideos.WhereParameters.Add("medGenre", this.ddlList.SelectedValue);

                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.lnqVideos.Where = "medMediaType == \"" + this.ddlMediaTypes.Items[0].Value + "\"";
                this.gvVideos.Sort("medTitle", SortDirection.Ascending);
            }

            this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
            this.lblFileMessages.Text = "";
            this.lblMessage.Text = "";
        }

        #endregion

        #region Controls Event Handlers

        protected void lnkMovieLink_Click(object sender, EventArgs e)
        {
            //this.wmPlayer.MovieURL = "";

            LinkButton movieLink = (sender as LinkButton);

            string location = movieLink.CommandArgument;
            
            if ((new FileInfo(location)).Exists)
            {
                //this.wmPlayer.MovieURL = location;
                this.lblMessage.Text = "Please click the Play button if the movie does not start";

            }
            else
                this.lblFileMessages.Text = "File could not be found";
        }

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

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());//Convert.ToInt32(this.hdnTotalRowCount.Value);//this.GetGridViewRecordCountByCurrentMediaType();

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
                if(sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue))
                {
                    DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = dir.Parent.Name;

                    if (!this.ddlList.Items.Contains(new ListItem(item)))
                        this.ddlList.Items.Add(item);
                }
            }            
        }

        #endregion

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset Page Index for Grid
            this.gvVideos.PageIndex = 0;
            this.ddlPageSize.SelectedIndex = 0;
            this.gvVideos.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);

            switch (this.ddlMediaTypes.SelectedValue)
            {   
                case "tv":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"tv\"";
                        //this.lnqVideos.Where = "medMediaType == \"tv\"";
                    }
                    break;
                case "basketball":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"basketball\"";
                        //this.lnqVideos.Where = "medMediaType == \"basketball\"";
                    }
                    break;
                case "musicvideo":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"musicvideo\"";
                        //this.lnqVideos.Where = "medMediaType == \"musicvideo\"";
                    }
                    break;
            }

            this.SetList();
            
            if(this.ddlList.Items.Count > 0)
                this.ddlList.SelectedIndex = 0;

            this.gvVideos.DataBind();
        }        

        protected void lnqVideos_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {   
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            this.SetList();

            if (this.ddlList.Items.Count > 0)
            {
                this.ddlList.SelectedIndex = Convert.ToInt32(Session["SelectedListIndex"]);
                this.lnqVideos.WhereParameters["medGenre"].DefaultValue = this.ddlList.Items[0].Value;
                this.lblList.Visible = true;
                this.ddlList.Visible = true;                
            }
            else
            {
                this.lblList.Visible = false;
                this.ddlList.Visible = false;
            }

            if (e.TotalRowCount == 0)
            {
                this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;
                //this.lblChooseMediaType.Visible = false;
                //this.ddlMediaTypes.Visible = false;
                this.lblList.Visible = false;
                this.ddlList.Visible = false;
            }
            else
            {
                this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;                
                this.lblRecordCount.Visible = true;
                //this.lblChooseMediaType.Visible = true;
                //this.ddlMediaTypes.Visible = true;
                this.lblList.Visible = true;
                this.ddlList.Visible = true;
            }
        }

        protected void ddlList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Filter by list item
            this.lnqVideos.WhereParameters["medGenre"].DefaultValue = this.ddlList.SelectedValue;
            this.gvVideos.DataBind();
        }
    }
}