using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MediaOnDemand
{
    public partial class OtherVideos : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected string postBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;
                this.ddlPageSize.SelectedIndex = this.ddlPageSize.Items.Count - 1;
                this.lnqVideos.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";

                if (this.gvVideos.Rows.Count > 0)
                {
                    this.wmPlayer.Visible = true;
                    this.gvVideos.PageSize = this.GetGridViewRecordCountByCurrentMediaType();
                }
                else
                    this.wmPlayer.Visible = false;

                this.gvVideos.Sort("medTitle", SortDirection.Ascending);
                UpdateRecordCount();
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
            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                this.gvVideos.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.gvVideos.PageIndex = 0;
            UpdateRecordCount();
        }

        #endregion

        #region Helper Methods

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = this.GetGridViewRecordCountByCurrentMediaType();

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

        private int GetGridViewRecordCountByCurrentMediaType()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var recs =

                (from StoredMedia in context.StoredMedias
                 where StoredMedia.medMediaType == "tv" || StoredMedia.medMediaType == "basketball" || StoredMedia.medMediaType == "documentary" || StoredMedia.medMediaType == "musicvideo"
                 select StoredMedia
                );

            return recs.Count();
        }

        #endregion

        protected void gvMovies_DataBound(object sender, EventArgs e)
        {
            if ((sender as GridView).Rows.Count == 0)
            {
                //this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
            }
            else
            {
                //this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }
        }

        protected void gvMovies_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset Page Index for Grid
            this.gvVideos.PageIndex = 0;

            switch (this.ddlMediaTypes.SelectedValue)
            {
                case "documentary":
                    {
                        this.lnqVideos.Where = "medMediaType == \"documentary\"";

                    }
                    break;
                case "tv":
                    {
                        this.lnqVideos.Where = "medMediaType == \"tv\"";
                    }
                    break;
                case "basketball":
                    {
                        this.lnqVideos.Where = "medMediaType == \"basketball\"";
                    }
                    break;
                case "musicvideo":
                    {
                        this.lnqVideos.Where = "medMediaType == \"musicvideo\"";
                    }
                    break;
            }

            UpdateRecordCount();
            this.gvVideos.DataBind();

        }
    }
}