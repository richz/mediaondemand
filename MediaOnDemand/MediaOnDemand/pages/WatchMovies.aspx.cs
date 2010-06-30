using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;
using MediaOnDemand;

namespace MediaOnDemand
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected string postBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            Session["SelectedGenreIndex"] = this.ddlGenre.SelectedIndex;

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                //this.wmPlayer.MovieURL = "";
                //this.wmPlayer.AutoStart = true;

                this.ddlPageSize.SelectedIndex = Convert.ToInt32(this.ddlPageSize.Items[0].Value);                
                this.gvMovies.Sort("medTitle", SortDirection.Ascending);
            }

            //this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
            //this.lblFileMessages.Text = "";
            this.lblMessage.Text = "";

            
        }

        #endregion

        #region Controls Event Handlers        

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMovies.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());                
            }
            else
                this.gvMovies.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);

            this.gvMovies.PageIndex = 0;
            //UpdateRecordCount();
        }

        #endregion

        #region Helper Methods

        private void SetList()
        {
            List<String> genres = new List<string>();

            this.ddlGenre.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals("movie"))
                {
                    DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = dir.Parent.Name;

                    if (!genres.Contains(item))
                        genres.Add(item);
                }
            }

            string [] arr = genres.ToArray();
            Array.Sort(arr);

            genres = arr.ToList();

            foreach (string genre in genres)
                this.ddlGenre.Items.Add(genre);

            if (this.ddlGenre.Items.Count == 0)
            {
                this.lblGenre.Visible = false;
                this.ddlGenre.Visible = false;
            }
            else
            {
                this.lblGenre.Visible = true;
                this.ddlGenre.Visible = true;
            }
        }

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());

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

        //private int GetGridViewRecordCountByCurrentMediaType()
        //{
        //    StorageMediaDataContext context = new StorageMediaDataContext();

        //    var recs =

        //        (from StoredMedia in context.StoredMedias
        //         where StoredMedia.medMediaType == "movie"
        //         select StoredMedia
        //        );

        //    return recs.Count();
        //}

        #endregion

        protected void lnqMovies_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();
            this.SetList();

            this.ddlGenre.SelectedIndex = Convert.ToInt32(Session["SelectedGenreIndex"].ToString());

            if (e.TotalRowCount == 0)
            {
                //this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;
            }
            else
            {
                //this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;
            }            
        }

        protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.lnqMovies.WhereParameters[2].DefaultValue = this.ddlGenre.SelectedValue;
        }
    }
}