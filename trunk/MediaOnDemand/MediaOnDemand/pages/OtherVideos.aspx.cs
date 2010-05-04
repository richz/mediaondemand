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
            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;
                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.lnqVideos.Where = "medMediaType == \"" + this.ddlMediaTypes.Items[0].Value + "\"";
                this.gvVideos.Sort("medTitle", SortDirection.Ascending);

                this.GetGridViewRecordCountByCurrentMediaType();

                //if (this.gvVideos.Rows.Count > 0)
                //{
                //    this.wmPlayer.Visible = true;
                //    this.gvVideos.PageSize = Session["TotalRowCount"];
                //}
                //else
                //    this.wmPlayer.Visible = false;
                
                //UpdateRecordCount();
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

        private int GetGridViewRecordCountByCurrentMediaType()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var recs =

                (from StoredMedia in context.StoredMedias
                 where StoredMedia.medMediaType == this.ddlMediaTypes.SelectedValue                 
                 select StoredMedia
                );

            return recs.Count();
        }

        #endregion

        protected void gvMovies_DataBound(object sender, EventArgs e)
        {
            if ((sender as GridView).Rows.Count == 0)
            {
                this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;
                //this.lblChooseMediaType.Visible = false;
                //this.ddlMediaTypes.Visible = false;
            }
            else
            {
                this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblChooseMediaType.Visible = true;
                this.ddlMediaTypes.Visible = true;
                this.lblRecordCount.Visible = true;
            }
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
        }

        protected void gvVideos_PageIndexChanged(object sender, EventArgs e)
        {
            //UpdateRecordCount();
        }

        protected void lnqVideos_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {   
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();
        }
    }
}