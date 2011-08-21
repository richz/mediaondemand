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
using MediaOnDemandLibrary;
using AjaxControlToolkit;

namespace MediaOnDemand
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        protected string postBackStr;

        #region Private Fields

        private bool RatingChanged = false;

        #endregion

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.gvMovies.Sort("medTitle", SortDirection.Ascending);

                this.ddlPageSize.SelectedIndex = Convert.ToInt32(this.ddlPageSize.Items[0].Value);

                this.SetList();
                this.ddlGenre.SelectedIndex = 0;
                
                Session["LinqDataSourceWhere"] = this.lnqMovies.Where = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\"");

                // Hide Submit Ratings Save buttons      
                for (int i = 0; i < Session.Keys.Count; i++ )
                    if (Session.Keys[i].EndsWith("btnSubmitRating"))
                        Session[i] = "hidden";                
            }          
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

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medId == mediaID)
                {
                    sm.medRating = rating;
                    break;
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

                foreach (StoredMedia sm in context.StoredMedias)
                    if (sm.medId == mediaID)
                        rating = sm.medRating != null ? Convert.ToInt32(sm.medRating) : 0;

                ratingControl.CurrentRating = rating;

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
                int totalCount = this.GetGridViewRecordCountByCurrentMediaType();
                this.gvMovies.PageSize = totalCount;
            }
            else
            {
                this.gvMovies.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }

            this.gvMovies.PageIndex = 0;
            this.lnqMovies.Where = Session["LinqDataSourceWhere"].ToString();
        }

        protected void lnqMovies_Selected(object sender, LinqDataSourceStatusEventArgs e)
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

        protected void ddlGenre_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.txtTitle.Text = "";
            Session["selectedGenreIndex"] = this.ddlGenre.SelectedIndex;

            if (this.ddlGenre.SelectedIndex == 0)
                Session["LinqDataSourceWhere"] = this.lnqMovies.Where = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\"");
            else
                Session["LinqDataSourceWhere"] = this.lnqMovies.Where = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\" && medGenre.Contains(\"{0}\")", this.ddlGenre.SelectedValue);

            this.gvMovies.PageIndex = 0;
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string titleFilter = this.txtTitle.Text;
            string genreFilter = this.ddlGenre.SelectedValue;
            string whereClause = "";

            if (String.IsNullOrEmpty(titleFilter))
            {
                if (genreFilter.Equals("all"))
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\"");
                else
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\" && medGenre == \"{0}\"", genreFilter);
            }
            else
            {
                if (genreFilter.Equals("all"))
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\" && medTitle.Contains(\"{1}\")", genreFilter, titleFilter);
                else
                    whereClause = String.Format("medIsViewable == 'Y' && medMediaType == \"movie\" && medGenre == \"{0}\" && medTitle.Contains(\"{1}\")", genreFilter, titleFilter);
            }

            Session["LinqDataSourceWhere"] = this.lnqMovies.Where = whereClause;
        }

        protected void gvMovies_PageIndexChanged(object sender, EventArgs e)
        {
            this.lnqMovies.Where = Session["LinqDataSourceWhere"] != null ? Session["LinqDataSourceWhere"].ToString() : String.Format("medIsViewable == 'Y' && medMediaType == \"movie\"");
        }

        protected void gvMovies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Session["PageIndex"] = e.NewPageIndex;

            Session["SubmitRatingImageUrl"] = "~/images/rating/savebutton.png";
        }

        #endregion

        #region Helper Methods

        private int GetGridViewRecordCountByCurrentMediaType()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var recs =

                (from sm in context.StoredMedias
                 where sm.medMediaType.Equals("movie") && sm.medIsViewable.Equals("Y")
                 select sm
                );

            return recs.Count();
        }

        private void SetList()
        {
            List<String> genres = new List<string>();

            this.ddlGenre.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals("movie"))
                {
                    string item = sm.medGenre;

                    if (!genres.Contains(item))
                        genres.Add(item);
                }
            }

            string[] arr = genres.ToArray();
            Array.Sort(arr);

            genres = arr.ToList();

            foreach (string genre in genres)
                this.ddlGenre.Items.Add(genre);

            if (this.ddlGenre.Items.Count > 0)
            {
                this.ddlGenre.Items.Insert(0, new ListItem("All", "all"));
                this.ddlGenre.Visible = true;

                if (!IsPostBack)
                    this.ddlGenre.SelectedIndex = 0;
                else
                    this.ddlGenre.SelectedIndex = Convert.ToInt32(Session["selectedGenreIndex"]);
            }
            else
            {
                this.ddlGenre.Visible = false;
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

       
    }
}