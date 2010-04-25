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
        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblFileMessages.Text = "";
            this.wmPlayer.MovieURL = "";

            if (!IsPostBack)
            {
                UpdateRecordCount();
            }
        }

        #endregion

        #region Controls Event Handlers

        protected void SongLinkButton_Click(object sender, EventArgs e)
        {
            this.wmPlayer.MovieURL = "";

            LinkButton songLink = (sender as LinkButton);

            string location = songLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                this.wmPlayer.MovieURL = location;
            }
            else
                this.lblFileMessages.Text = "File could not be found";
        }

        #endregion

        #region Controls Event Handlers

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMusic.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                this.gvMusic.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

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
                 where StoredMedia.medMediaType == "movie"
                 select StoredMedia
                );

            return recs.Count();
        }

        #endregion
    }
}