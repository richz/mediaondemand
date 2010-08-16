using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;
using MediaOnDemand;
using MediaOnDemand.UserControls.MediaControls;
using System.Web.Caching;

namespace MediaOnDemand
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected string postBackStr;
        private List<Pair> playList;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;
            
            if (!IsPostBack)
            {
                this.playList = new List<Pair>();

                Cache.Insert("MediaPlayList", playList);
                
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                SetList();
                //this.wmPlayer.MovieURL = "";
                //this.wmPlayer.AutoStart = true;

                this.ddlPageSize.SelectedIndex = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvMovies.Sort("medTitle", SortDirection.Ascending);

            }
            
            //this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
            //this.lblFileMessages.Text = "";
            this.lblMessage.Text = "";
            
            if (!String.IsNullOrEmpty(this.hdnMediaUrl.Value))
            {
                this.hdnMediaId.Value = GetMediaIdFromUrl(Path.GetFileNameWithoutExtension(this.hdnMediaUrl.Value), this.hdnMediaUrl.Value) + "";                
            }
            
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string AddPlayListItemToCache()
        {
            

            //(Cache["MediaPlayList"] as List<Pair>).Add(new Pair("Title", "Location"));


            return "All finished!";
        }


        private int GetMediaIdFromUrl(string mediaTitle, string mediaUrl)
        {
            int mediaId = -1;

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medLocation == mediaUrl && sm.medTitle.Equals(mediaTitle))
                    mediaId = sm.medId;
            }

            return mediaId;
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
                    if (!genres.Contains(sm.medGenre))
                        genres.Add(sm.medGenre);
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

        #endregion

        protected void lnqMovies_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount.ToString();
            UpdateRecordCount();
    
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
            this.lnqMovies.WhereParameters[3].DefaultValue = this.ddlGenre.SelectedValue;

            this.ddlPageSize.SelectedIndex = 0;
            this.gvMovies.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);
        }

        protected void gvMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.hdnSelectedMedia.Value = (gvMovies.SelectedRow.FindControl("lblTitle") as Label).Text;

            //this.mediaPlaylist.Playlist.Add(this.hdnSelectedMedia.Value);

            int i = 0;
            i++;
        }

        protected void btnAddSelectedMediaToPlaylist_Click(object sender, EventArgs e)
        {
            bool atLeastOneRowSelected = false;

            StorageMediaDataContext context = new StorageMediaDataContext();
            
            foreach(GridViewRow row in gvMovies.Rows)
            {
                CheckBox cbMediaSelector = row.FindControl("cbMediaSelector") as CheckBox;

                if (cbMediaSelector != null)
                {
                    cbMediaSelector.Checked = true;

                    atLeastOneRowSelected = true;

                    foreach (StoredMedia sm in context.StoredMedias)
                    {
                        //if (sm.medId == Convert.ToInt32() && !this.mediaPlaylist.PlayListContains(sm.medTitle))
                        //    this.mediaPlaylist.PlaylistItems.Add(sm.medTitle);
                    }

                    cbMediaSelector.Checked = false;
                }
            }
        }

        protected void gvMovies_DataBound(object sender, EventArgs e)
        {
            
        }

        protected void lnkAddSelected_Click(object sender, EventArgs e)
        {

        }

        protected void lnkRemoveSelected_Click(object sender, EventArgs e)
        {

        }

        protected void btnRemoveAllSelected_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewMediaSelector_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnAddToPlaylist_Click(object sender, EventArgs e)
        {
            //this.mediaPlaylist.PlayList.Items.Add(

            string mediaId = (sender as Button).CommandArgument;

            StorageMediaDataContext context = new StorageMediaDataContext();

            var result = from StoredMedia sm in context.StoredMedias
                         where sm.medId == Convert.ToInt32(mediaId)
                         select sm;

            StoredMedia media = result.First();
            
            
        }

        protected void btnAddAllMediaToPlaylist_Click(object sender, EventArgs e)
        {

        }

    }
}