﻿using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MediaOnDemand;
using MediaOnDemandLibrary;
using AjaxControlToolkit;

namespace MediaOnDemand
{
    public partial class OtherVideos : System.Web.UI.Page
    {
        protected string postBackStr;
        private bool RatingChanged = false;

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            if (!IsPostBack)
            {
                SetList();

                // Hide Submit Ratings Save buttons      
                for (int i = 0; i < Session.Keys.Count; i++)
                    if (Session.Keys[i].EndsWith("btnSubmitRating"))
                        Session[i] = "hidden";    
            }
            
            if (this.hdnHasMediaPlayed.Value.Equals("Y"))
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

                this.hdnHasMediaPlayed.Value = "N";
            }

        }

        #endregion

        #region Controls Event Handlers

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
                this.gvVideos.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());
            }
            else
                this.gvVideos.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);

            this.gvVideos.PageIndex = 0;
        }

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Reset Page Index for Grid
            this.gvVideos.PageIndex = 0;
            this.ddlPageSize.SelectedIndex = 0;
            this.gvVideos.PageSize = Convert.ToInt32(ddlPageSize.SelectedValue);

            SetList();
        }

        protected void lnqVideos_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount > 0)
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;

                this.lblChooseMediaType.Visible = true;
                this.ddlMediaTypes.Visible = true;
            }
            else
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;             
            }
        }

        #endregion

        #region Helper Methods

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());

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

        private void SetList()
        {
            this.ddlList.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue))
                {
                    string item = sm.medGenre;

                    if (!this.ddlList.Items.Contains(new ListItem(item)))
                        this.ddlList.Items.Add(item);
                }
            }

            if (ddlList.Items.Count > 0)
            {
                WebHelper.SortDropDownListItems(ddlList);
                this.ddlList.SelectedIndex = 0;

                this.lblChooseSeries.Visible = true;
                this.ddlList.Visible = true;
            }
            else
            {
                this.lblChooseSeries.Visible = false;
                this.ddlList.Visible = false;
            }
        }

        #endregion
    }
}