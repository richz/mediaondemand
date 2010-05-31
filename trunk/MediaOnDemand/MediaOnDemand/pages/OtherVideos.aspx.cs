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
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;

                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvVideos.Sort("medTitle", SortDirection.Ascending);
            }

            this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
            this.lblFileMessages.Text = "";
            this.lblMessage.Text = "";
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
                    }
                    break;
                case "basketball":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"basketball\"";                        
                    }
                    break;
                case "musicvideo":
                    {
                        this.lnqVideos.WhereParameters["medMediaType"].DefaultValue = "\"musicvideo\"";                        
                    }
                    break;
            }

            if (Convert.ToInt32(Session["TotalRowCount"].ToString()) > 0)
            {
                SetList();
                this.ddlList.SelectedIndex = 0;
            }
        }        

        protected void lnqVideos_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {   
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount == 0)
            {
                this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;                
                this.lblList.Visible = false;
                this.ddlList.Visible = false;
            }
            else
            {
                this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;                
                this.lblRecordCount.Visible = true;                
                this.lblList.Visible = true;
                this.ddlList.Visible = true;
            }
        }

        protected void ddlMediaTypes_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetList();
                this.ddlList.SelectedIndex = 0;
            }

        }
    }
}