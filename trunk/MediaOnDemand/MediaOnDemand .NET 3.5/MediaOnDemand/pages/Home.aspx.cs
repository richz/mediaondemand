using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using System.IO;
using AjaxControlToolkit;
using System.Data.OleDb;
using System.Data;
using System.Threading;
using System.Net;

namespace MediaOnDemand
{
    public partial class Home : System.Web.UI.Page
    {
        protected string postBackStr;

        #region Private Fields

        private bool RatingChanged = false;

        public int LatestMediaPlayedCurrentPage
        {
            get
            {
                // look for current page in ViewState

                object o = this.ViewState["_LatestMediaPlayedCurrentPage"];

                if (o == null)

                    return 0; // default to showing the first page

                else
                    return (int)o;
            }

            set
            {
                this.ViewState["_LatestMediaPlayedCurrentPage"] = value;
            }
        }

        public int LatestMediaAddedCurrentPage
        {
            get
            {
                // look for current page in ViewState

                object o = this.ViewState["_LatestMediaAddedCurrentPage"];

                if (o == null)

                    return 0; // default to showing the first page

                else
                    return (int)o;
            }

            set
            {
                this.ViewState["_LatestMediaAddedCurrentPage"] = value;
            }
        }

        public int HighestRatedMediaCurrentPage
        {
            get
            {
                // look for current page in ViewState

                object o = this.ViewState["_HighestRatedMediaCurrentPage"];

                if (o == null)

                    return 0; // default to showing the first page

                else
                    return (int)o;
            }

            set
            {
                this.ViewState["_HighestRatedMediaCurrentPage"] = value;
            }
        }

        #endregion

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");

                ImageButton btnPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnPreviousLatestMediaPlayed") as ImageButton;
                ImageButton btnNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaPlayed") as ImageButton;

                Label lblNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaPlayed") as Label;
                Label lblPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaPlayed") as Label;

                ItemsGet(dlLatestMediaPlayed, dsLatestMediaPlayed, btnPreviousLatestMediaPlayed, btnNextLatestMediaPlayed, lblPreviousLatestMediaPlayed, lblNextLatestMediaPlayed);

                ImageButton btnPreviousLatestMediaAdded = dlLatestMediaAdded.Parent.FindControl("btnPreviousLatestMediaAdded") as ImageButton;
                ImageButton btnNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaAdded") as ImageButton;

                Label lblNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaAdded") as Label;
                Label lblPreviousLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaAdded") as Label;

                ItemsGet(dlLatestMediaAdded, dsLatestMediaAdded, btnPreviousLatestMediaAdded, btnNextLatestMediaAdded, lblPreviousLatestMediaAdded, lblNextLatestMediaAdded);

                ImageButton btnPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnPreviousHighestRatedMedia") as ImageButton;
                ImageButton btnNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnNextHighestRatedMedia") as ImageButton;

                Label lblNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblNextHighestRatedMedia") as Label;
                Label lblPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblPreviousHighestRatedMedia") as Label;

                ItemsGet(dlHighestRatedMedia, dsHighestRatedMedia, btnPreviousHighestRatedMedia, btnNextHighestRatedMedia, lblPreviousHighestRatedMedia, lblNextHighestRatedMedia);


            }
        }

        #endregion

        #region Control Event Handlers

        protected void imgPosterImage_Load(object sender, EventArgs e)
        {
            Image img = sender as Image;

            if (!ImageExists(img.ImageUrl))
                img.ImageUrl = "../images/missingimage.jpg";
        }

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

        protected void Save_Rating1(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = sender as ImageButton;
            Rating ratingControl = btnSubmitRating.Parent.FindControl("ratingControl1") as Rating;

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

        protected void Save_Rating2(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = sender as ImageButton;
            Rating ratingControl = btnSubmitRating.Parent.FindControl("ratingControl2") as Rating;

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

        protected void Save_Rating3(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = sender as ImageButton;
            Rating ratingControl = btnSubmitRating.Parent.FindControl("ratingControl3") as Rating;

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

        protected void ratingControl1_Changed(object sender, EventArgs e)
        {
            this.RatingChanged = true;
            Rating ratingControl = sender as Rating;
            //string s = ratingControl.ID.ToArray()[ratingControl.ID.Length - 1].ToString();

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating1") as ImageButton;

            Session[btnSubmitRating.ClientID] = "visible";
        }

        protected void ratingControl2_Changed(object sender, EventArgs e)
        {
            this.RatingChanged = true;
            Rating ratingControl = sender as Rating;

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating2") as ImageButton;

            Session[btnSubmitRating.ClientID] = "visible";
        }

        protected void ratingControl3_Changed(object sender, EventArgs e)
        {
            this.RatingChanged = true;
            Rating ratingControl = sender as Rating;

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating3") as ImageButton;

            Session[btnSubmitRating.ClientID] = "visible";
        }

        protected void ratingControl1_PreRender(object sender, EventArgs e)
        {
            int rating = 0;
            Rating ratingControl = (sender as Rating);
            //string s = ratingControl.ID.ToArray()[ratingControl.ID.Length - 1].ToString();

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating1") as ImageButton;

            int mediaID = Convert.ToInt32(btnSubmitRating.CommandArgument);

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medId == mediaID)
                    rating = sm.medRating != null ? Convert.ToInt32(sm.medRating) : 0;

            ratingControl.CurrentRating = rating;

        }

        protected void ratingControl2_PreRender(object sender, EventArgs e)
        {
            int rating = 0;
            Rating ratingControl = (sender as Rating);

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating2") as ImageButton;

            int mediaID = Convert.ToInt32(btnSubmitRating.CommandArgument);

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medId == mediaID)
                    rating = sm.medRating != null ? Convert.ToInt32(sm.medRating) : 0;

            ratingControl.CurrentRating = rating;

        }

        protected void ratingControl3_PreRender(object sender, EventArgs e)
        {
            int rating = 0;
            Rating ratingControl = (sender as Rating);

            ImageButton btnSubmitRating = ratingControl.Parent.FindControl("btnSubmitRating3") as ImageButton;

            int mediaID = Convert.ToInt32(btnSubmitRating.CommandArgument);

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medId == mediaID)
                    rating = sm.medRating != null ? Convert.ToInt32(sm.medRating) : 0;

            ratingControl.CurrentRating = rating;

        }

        protected void ratingPanel1_PreRender(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = (sender as Panel).FindControl("btnSubmitRating1") as ImageButton;

            if (Session[btnSubmitRating.ClientID] == null || Session[btnSubmitRating.ClientID].Equals("hidden"))
                btnSubmitRating.Visible = false;
            else
                btnSubmitRating.Visible = true;
        }

        protected void ratingPanel2_PreRender(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = (sender as Panel).FindControl("btnSubmitRating2") as ImageButton;

            if (Session[btnSubmitRating.ClientID] == null || Session[btnSubmitRating.ClientID].Equals("hidden"))
                btnSubmitRating.Visible = false;
            else
                btnSubmitRating.Visible = true;
        }

        protected void ratingPanel3_PreRender(object sender, EventArgs e)
        {
            ImageButton btnSubmitRating = (sender as Panel).FindControl("btnSubmitRating3") as ImageButton;

            if (Session[btnSubmitRating.ClientID] == null || Session[btnSubmitRating.ClientID].Equals("hidden"))
                btnSubmitRating.Visible = false;
            else
                btnSubmitRating.Visible = true;
        }

        protected void btnPreviousLatestMediaPlayed_Click(object sender, ImageClickEventArgs e)
        {
            // Set viewstate variable to the previous page

            LatestMediaPlayedCurrentPage -= 1;

            // Reload control

            ImageButton btnPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnPreviousLatestMediaPlayed") as ImageButton;
            ImageButton btnNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaPlayed") as ImageButton;

            Label lblNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaPlayed") as Label;
            Label lblPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaPlayed") as Label;

            ItemsGet(dlLatestMediaPlayed, dsLatestMediaPlayed, btnPreviousLatestMediaPlayed, btnNextLatestMediaPlayed, lblPreviousLatestMediaPlayed, lblNextLatestMediaPlayed);
        }

        protected void btnNextLatestMediaPlayed_Click(object sender, ImageClickEventArgs e)
        {

            // Set viewstate variable to the next page
            LatestMediaPlayedCurrentPage += 1;

            // Reload control

            ImageButton btnPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnPreviousLatestMediaPlayed") as ImageButton;
            ImageButton btnNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaPlayed") as ImageButton;

            Label lblNextLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaPlayed") as Label;
            Label lblPreviousLatestMediaPlayed = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaPlayed") as Label;

            ItemsGet(dlLatestMediaPlayed, dsLatestMediaPlayed, btnPreviousLatestMediaPlayed, btnNextLatestMediaPlayed, lblPreviousLatestMediaPlayed, lblNextLatestMediaPlayed);
        }


        protected void btnPreviousLatestMediaAdded_Click(object sender, ImageClickEventArgs e)
        {
            // Set viewstate variable to the previous page

            LatestMediaAddedCurrentPage -= 1;

            // Reload control

            ImageButton btnPreviousLatestMediaAdded = dlLatestMediaAdded.Parent.FindControl("btnPreviousLatestMediaAdded") as ImageButton;
            ImageButton btnNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaAdded") as ImageButton;

            Label lblNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaAdded") as Label;
            Label lblPreviousLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaAdded") as Label;

            ItemsGet(dlLatestMediaAdded, dsLatestMediaAdded, btnPreviousLatestMediaAdded, btnNextLatestMediaAdded, lblPreviousLatestMediaAdded, lblNextLatestMediaAdded);
        }

        protected void btnNextLatestMediaAdded_Click(object sender, ImageClickEventArgs e)
        {
            // Set viewstate variable to the previous page

            LatestMediaAddedCurrentPage += 1;

            // Reload control

            ImageButton btnPreviousLatestMediaAdded = dlLatestMediaAdded.Parent.FindControl("btnPreviousLatestMediaAdded") as ImageButton;
            ImageButton btnNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("btnNextLatestMediaAdded") as ImageButton;

            Label lblNextLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblNextLatestMediaAdded") as Label;
            Label lblPreviousLatestMediaAdded = dlLatestMediaPlayed.Parent.FindControl("lblPreviousLatestMediaAdded") as Label;

            ItemsGet(dlLatestMediaAdded, dsLatestMediaAdded, btnPreviousLatestMediaAdded, btnNextLatestMediaAdded, lblPreviousLatestMediaAdded, lblNextLatestMediaAdded);
        }

        protected void btnPreviousHighestRatedMedia_Click(object sender, ImageClickEventArgs e)
        {
            // Set viewstate variable to the previous page

            HighestRatedMediaCurrentPage -= 1;

            // Reload control

            ImageButton btnPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnPreviousHighestRatedMedia") as ImageButton;
            ImageButton btnNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnNextHighestRatedMedia") as ImageButton;

            Label lblNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblNextHighestRatedMedia") as Label;
            Label lblPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblPreviousHighestRatedMedia") as Label;

            ItemsGet(dlHighestRatedMedia, dsHighestRatedMedia, btnPreviousHighestRatedMedia, btnNextHighestRatedMedia, lblPreviousHighestRatedMedia, lblNextHighestRatedMedia);
        }

        protected void btnNextHighestRatedMedia_Click(object sender, ImageClickEventArgs e)
        {

            // Set viewstate variable to the previous page

            HighestRatedMediaCurrentPage += 1;

            // Reload control

            ImageButton btnPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnPreviousHighestRatedMedia") as ImageButton;
            ImageButton btnNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("btnNextHighestRatedMedia") as ImageButton;

            Label lblNextHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblNextHighestRatedMedia") as Label;
            Label lblPreviousHighestRatedMedia = dlHighestRatedMedia.Parent.FindControl("lblPreviousHighestRatedMedia") as Label;

            ItemsGet(dlHighestRatedMedia, dsHighestRatedMedia, btnPreviousHighestRatedMedia, btnNextHighestRatedMedia, lblPreviousHighestRatedMedia, lblNextHighestRatedMedia);
        }

        #endregion

        #region Helper Methods

        private bool ImageExists(string imageUrl)
        {
            bool imageExists = false;

            string baseUrl = HttpContext.Current.Request.Url.Scheme + "://" + HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath.TrimEnd('/') + '/';

            //HttpWebRequest req = default(HttpWebRequest);
            WebRequest req = WebRequest.Create(baseUrl + imageUrl.Substring(3));
            WebResponse resp = default(WebResponse);
            try
            {
                resp = req.GetResponse();
                imageExists = true;
            }
            catch (Exception ex)
            {
                imageExists = false;
            }

            return imageExists;

        }

        private void ItemsGet(DataList dataList, SqlDataSource dataSource, ImageButton previousButton, ImageButton nextButton, Label previousLabel, Label nextLabel)
        {
            // Populate the repeater control with the Items DataSet
            PagedDataSource objPds = new PagedDataSource();

            DataView dv = (DataView)dataSource.Select(DataSourceSelectArguments.Empty);

            objPds.DataSource = dv;

            objPds.AllowPaging = true;

            objPds.PageSize = 5;

            switch (dataList.ID)
            {
                case "dlLatestMediaPlayed":
                    objPds.CurrentPageIndex = LatestMediaPlayedCurrentPage;
                    break;
                case "dlLatestMediaAdded":
                    objPds.CurrentPageIndex = LatestMediaAddedCurrentPage;
                    break;
                case "dlHighestRatedMedia":
                    objPds.CurrentPageIndex = HighestRatedMediaCurrentPage;
                    break;
            }

            // Disable/Hide Prev or Next buttons if necessary
            previousLabel.Visible = previousButton.Enabled = previousButton.Visible = !objPds.IsFirstPage;
            nextLabel.Visible = nextButton.Enabled = nextButton.Visible = !objPds.IsLastPage;

            dataList.DataSource = objPds;

            dataList.DataBind();
        }

        #endregion
        
    }
}