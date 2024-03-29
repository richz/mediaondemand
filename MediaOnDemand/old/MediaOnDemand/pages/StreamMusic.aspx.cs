﻿using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;
using MediaOnDemand;
using AjaxControlToolkit;
using System.Web.Security;

namespace MediaOnDemand
{
    public partial class StreamMusic : System.Web.UI.Page
    {
        protected string postBackStr;
        private bool RatingChanged = false;

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.gvMusic.Sort("medTitle", SortDirection.Ascending);

                SetList();
                this.ddlArtist.SelectedIndex = 0;
                
                Session["LinqDataSourceWhere"] = this.lnqMusic.Where = String.Format("medIsViewable == 'Y' && medMediaType == \"music\"");

                // Hide Submit Ratings Save buttons      
                for (int i = 0; i < Session.Keys.Count; i++)
                    if (Session.Keys[i].EndsWith("btnSubmitRating"))
                        Session[i] = "hidden";    
            }
        }

        #endregion

        #region Controls Event Handlers

        protected void btnSaveMediaPlayed_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(this.hdnMediaId.Value);

                StorageMediaDataContext context = new StorageMediaDataContext();


                StoredMedia sm = (from storedMedia in context.StoredMedias
                                  where storedMedia.medId == id
                                  orderby storedMedia.medDateAdded descending
                                  select storedMedia).First();


                sm.medLastPlayedDate = DateTime.Now;

                context.SubmitChanges();
            }
            catch (Exception ex)
            {

            }

            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }

        protected void Save_Rating(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = sender as ImageButton;
            Rating ratingControl = btnSubmitRating.Parent.FindControl("ratingControl") as Rating;

            int rating = ratingControl.CurrentRating;

            int mediaID = Convert.ToInt32(btnSubmitRating.CommandArgument);

            string userName = Membership.GetUser().UserName;

            StorageMediaDataContext context = new StorageMediaDataContext();

            var mediaRatingRecs = from MediaRating mediaRatingRec in context.MediaRatings
                                  where mediaRatingRec.rtgMediaId == mediaID && mediaRatingRec.rtgUserName == userName
                                  select mediaRatingRec;

            MediaRating mediaRating;

            // Update existing rating record for current user for media selected
            if (mediaRatingRecs.Count() > 0)
            {
                mediaRating = mediaRatingRecs.First();
                mediaRating.rtgRating = rating;
            }
            else
            {
                mediaRating = new MediaRating
                {
                    rtgMediaId = mediaID,
                    rtgRating = rating,
                    rtgUserName = userName
                };

                context.MediaRatings.InsertOnSubmit(mediaRating);
            }

            try
            {
                context.SubmitChanges();

                Session[btnSubmitRating.ClientID] = "hidden";

            }
            catch (Exception ex)
            { }

        }

        protected void ratingControl_PreRender(object sender, EventArgs e)
        {
            if (!this.RatingChanged)
            {
                int rating = 0;
                Rating ratingControl = (sender as Rating);
                ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating") as ImageButton;

                int mediaID = Convert.ToInt32(btnSubmitRating.CommandArgument);
                
                StorageMediaDataContext context = new StorageMediaDataContext();

                var mediaRatingRecs = from MediaRating mediaRatingRec in context.MediaRatings
                                      where mediaRatingRec.rtgMediaId == mediaID
                                      select mediaRatingRec;

                List<MediaRating> mediaRatings = mediaRatingRecs.ToList<MediaRating>();

                double totalRatings = 0.0;

                foreach (MediaRating mr in mediaRatings)
                {
                    totalRatings += mr.rtgRating;
                }

                rating = (int)Math.Ceiling(totalRatings / mediaRatings.Count());
                
                if (mediaRatingRecs.Count() > 0)
                    ratingControl.CurrentRating = rating;
                else
                    ratingControl.CurrentRating = 0;

                this.RatingChanged = false;
            }
        }

        protected void ratingControl_Changed(object sender, EventArgs e)
        {
            this.RatingChanged = true;
            Rating ratingControl = sender as Rating;

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating") as ImageButton;

            Session[btnSubmitRating.ClientID] = "visible";
        }

        protected void ratingPanel_PreRender(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = (sender as Panel).FindControl("btnSubmitRating") as ImageButton;

            if (Session[btnSubmitRating.ClientID] == null || Session[btnSubmitRating.ClientID].Equals("hidden"))
                btnSubmitRating.Visible = false;
            else
                btnSubmitRating.Visible = true;
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMusic.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());
            }
            else
                this.gvMusic.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);

            this.gvMusic.PageIndex = 0;
            this.lnqMusic.Where = Session["LinqDataSourceWhere"].ToString();
        }

        protected void lnqMusic_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;

            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;

            }
        }

        protected void ddlArtist_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txtTitle.Text = "";

            Session["selectedArtistIndex"] = this.ddlArtist.SelectedIndex;

            if (this.ddlArtist.SelectedIndex == 0)
                Session["LinqDataSourceWhere"] = this.lnqMusic.Where = String.Format("medMediaType == \"music\"");
            else
                Session["LinqDataSourceWhere"] = this.lnqMusic.Where = String.Format("medMediaType == \"music\" && medArtist.Contains(\"{0}\")", this.ddlArtist.SelectedValue);

            this.gvMusic.PageIndex = 0;

        }
               
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string titleFilter = this.txtTitle.Text;
            string artistFilter = this.ddlArtist.SelectedValue;
            string whereClause = "";

            if (String.IsNullOrEmpty(titleFilter))
            {
                if (artistFilter.Equals("all"))
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"music\"");
                else
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"music\" && medArtist == \"{0}\"", artistFilter);
            }
            else
            {
                if (artistFilter.Equals("all"))
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"music\" && medTitle.Contains(\"{1}\")", artistFilter, titleFilter);
                else
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"music\" && medArtist == \"{0}\" && medTitle.Contains(\"{1}\")", artistFilter, titleFilter);
            }

            Session["LinqDataSourceWhere"] = this.lnqMusic.Where = whereClause;
        }

        protected void gvMusic_PageIndexChanged(object sender, EventArgs e)
        {
            this.lnqMusic.Where = Session["LinqDataSourceWhere"].ToString();
        }

        #endregion

        #region Helper Methods

        private void SetList()
        {
            List<String> artists = new List<string>();

            this.ddlArtist.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals("music"))
                {
                    DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = dir.Parent.Parent.Name;

                    if (!artists.Contains(item))
                        artists.Add(item);
                }
            }

            string[] arr = artists.ToArray();
            Array.Sort(arr);

            artists = arr.ToList();

            foreach (string artist in artists)
                this.ddlArtist.Items.Add(artist);

            if (this.ddlArtist.Items.Count > 0)
            {
                this.ddlArtist.Items.Insert(0, new ListItem("All","all"));
                this.ddlArtist.Visible = true;

                if (!IsPostBack)
                    this.ddlArtist.SelectedIndex = Convert.ToInt32(Session["selectedArtistIndex"]);
            }
            else
            {
                this.ddlArtist.Visible = false;
            }
        }

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());

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

        protected void btnAddToPlaylist_Click(object sender, ImageClickEventArgs e)
        {
            string userName = Membership.GetUser().UserName;
            int medId = Convert.ToInt32((sender as ImageButton).CommandArgument);

            StorageMediaDataContext context = new StorageMediaDataContext();

            bool itemExists = false;

            foreach (UserMediaPlayList userPlaylist in context.UserMediaPlayLists)
                if (userPlaylist.plstUserName.Equals(userName) && userPlaylist.plstMediaId == medId)
                    itemExists = true;

            if (!itemExists)
            {
                string mediaTitle = "";
                string mediaLocation = "";

                foreach (StoredMedia sm in context.StoredMedias)
                    if (sm.medId == medId)
                    {
                        mediaTitle = sm.medTitle;
                        mediaLocation = sm.medLocation;
                    }
                int playlistIndex = 0;

                int max = 0;

                foreach (UserMediaPlayList userPlaylist in context.UserMediaPlayLists)
                    if (userPlaylist.plstPlaylistIndex > max)
                        max = userPlaylist.plstPlaylistIndex;

                if (context.UserMediaPlayLists.Count() == 0)
                    playlistIndex = 0;
                else
                    playlistIndex = max + 1;

                UserMediaPlayList playList = new UserMediaPlayList
                {
                    plstUserName = userName,
                    plstMediaId = medId,
                    plstPlaylistIndex = playlistIndex,
                    plstMediaTitle = mediaTitle,
                    plstMediaLocation = mediaLocation
                };

                context.UserMediaPlayLists.InsertOnSubmit(playList);

                try
                {
                    context.SubmitChanges();
                }
                catch (Exception ex)
                { }

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}