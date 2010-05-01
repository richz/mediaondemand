using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;

namespace MediaOnDemand
{
    public partial class StreamMusic : System.Web.UI.Page
    {
        protected string postBackStr;

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblMessage.Text = "";
            this.lblFileMessages.Text = "";
            this.wmPlayer.MovieURL = "";

            if (!IsPostBack)
            {
                if(this.gvMusic.Rows.Count > 0)
                    this.gvMusic.PageSize = this.GetGridViewRecordCountByCurrentMediaType();
                this.ddlPageSize.SelectedIndex = this.ddlPageSize.Items.Count - 1;
                UpdateRecordCount();
                this.gvMusic.Sort("medTitle", SortDirection.Ascending);
                
            }

            this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
        }

        #endregion

        #region Controls Event Handlers
             
        #endregion

        #region Controls Event Handlers

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;
                this.ddlPageSize.SelectedIndex = this.ddlPageSize.Items.Count - 1;
            }
            else
                this.gvMusic.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;

            this.gvMusic.PageIndex = 0;
            UpdateRecordCount();
        }

        #endregion

        #region Helper Methods

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = this.GetGridViewRecordCountByCurrentMediaType();

            int iEndRecord = gvMusic.PageSize * (gvMusic.PageIndex + 1);
            int iStartsRecods = iEndRecord - gvMusic.PageSize;

            if (iEndRecord > iTotalRecords)
                iEndRecord = iTotalRecords;

            if (iStartsRecods == 0 || iStartsRecods % gvMusic.PageSize == 0) iStartsRecods += 1;
            if (iEndRecord == 0) iEndRecord = iTotalRecords;

            if (iTotalRecords == 0)
                this.lblRecordCount.Text = "";
            else
                this.lblRecordCount.Text = iStartsRecods + " to " + iEndRecord.ToString() + " of " + iTotalRecords.ToString();

        }

        private int GetGridViewRecordCountByCurrentMediaType()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var recs =

                (from StoredMedia in context.StoredMedias
                 where StoredMedia.medMediaType == "music"
                 select StoredMedia
                );

            return recs.Count();
        }

        #endregion

        protected void gvMusic_DataBound(object sender, EventArgs e)
        {
            if ((sender as GridView).Rows.Count == 0)
            {
                this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;
            }
            else
            {
                this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;
            }
        }
    }
}