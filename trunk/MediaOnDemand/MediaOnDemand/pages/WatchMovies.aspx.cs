using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;

namespace MediaOnDemand
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblMessage.Text = "";

            if (!IsPostBack)
            {
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;
                this.gvMovies.PageSize = 20;
                UpdateRecordCount();
            }

            this.lblFileMessages.Text = "";
            
        }

        #endregion

        #region Controls Event Handlers

        protected void lnkMovieLink_Click(object sender, EventArgs e)
        {
            this.wmPlayer.MovieURL = "";

            LinkButton movieLink = (sender as LinkButton);

            string location = movieLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                this.wmPlayer.MovieURL = location;
                this.lblMessage.Text = "Please click othe Play button if the movie does not start";

               // ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Player Window", "window.open ('Player.aspx?file=" + location + "','MediaPlayer')", true);
            }
            else
                this.lblFileMessages.Text = "File could not be found";

        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {           

            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMovies.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                this.gvMovies.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.gvMovies.PageIndex = 0;
            UpdateRecordCount();
        }

        #endregion

        #region Helper Methods

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = this.GetGridViewRecordCountByCurrentMediaType();

            int iEndRecord = gvMovies.PageSize * (gvMovies.PageIndex + 1);
            int iStartsRecods = iEndRecord - gvMovies.PageSize;

            if (iEndRecord > iTotalRecords)
                iEndRecord = iTotalRecords;

            if (iStartsRecods == 0 || iStartsRecods % gvMovies.PageSize == 0) iStartsRecods += 1;
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