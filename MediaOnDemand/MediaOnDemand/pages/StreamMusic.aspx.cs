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

namespace MediaOnDemand
{
    public partial class StreamMusic : System.Web.UI.Page
    {
        protected string postBackStr;

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["SelectedArtistIndex"] = this.ddlArtist.SelectedIndex;

            this.lblMessage.Text = "";
            this.lblFileMessages.Text = "";
            this.wmPlayer.MovieURL = "";

            if (!IsPostBack)
            {
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");
                this.gvMusic.Sort("medTitle", SortDirection.Ascending);

                this.wmPlayer.AutoStart = true;

                this.ddlArtist.SelectedIndex = 0;
                this.lnqMusic.WhereParameters.Add("medArtist", this.ddlArtist.SelectedValue);

                this.gvMusic.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvMusic.Sort("medTitle", SortDirection.Ascending);
            }

            this.wmPlayer.MovieURL = this.hdnMediaUrl.Value;
        }

        #endregion

        #region Controls Event Handlers

        #endregion

        #region Controls Event Handlers

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMusic.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());
            }
            else
                this.gvMusic.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);

            this.gvMusic.PageIndex = 0;
        }

        #endregion

        #region Helper Methods

        private void SetList()
        {
            List<String> genres = new List<string>();

            this.ddlArtist.Items.Clear();

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals("music"))
                {
                    DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
                    string item = dir.Parent.Name;

                    if (!genres.Contains(item))
                        genres.Add(item);
                }
            }

            string[] arr = genres.ToArray();
            Array.Sort(arr);

            genres = arr.ToList();

            foreach (string genre in genres)
                this.ddlArtist.Items.Add(genre);
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

        protected void lnqMusic_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            this.SetList();


            this.ddlArtist.SelectedIndex = Convert.ToInt32(Session["SelectedArtistIndex"].ToString());

            if (e.TotalRowCount == 0)
            {
                this.wmPlayer.Visible = false;
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                this.lblRecordCount.Visible = false;

                this.lblArtist.Visible = false;
                this.ddlArtist.Visible = false;
            }
            else
            {
                this.wmPlayer.Visible = true;
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                this.lblRecordCount.Visible = true;

                this.lblArtist.Visible = true;
                this.ddlArtist.Visible = true;
            }
        }

        protected void ddlArtist_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.lnqMusic.WhereParameters[2].DefaultValue = this.ddlArtist.SelectedValue;
        }
    }
}