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
using MediaOnDemandLibrary;

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
                Session["SelectedGenreIndex"] = 1;

                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");

                this.ddlPageSize.SelectedIndex = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvMovies.Sort("medTitle", SortDirection.Ascending);
            }

            this.lblMessage.Text = "";

            if (!String.IsNullOrEmpty(this.hdnMediaUrl.Value))
            {
                this.hdnMediaId.Value = GetMediaIdFromUrl(Path.GetFileNameWithoutExtension(this.hdnMediaUrl.Value), this.hdnMediaUrl.Value) + "";
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

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (this.ddlPageSize.SelectedValue.Equals("all"))
            //{
            //    this.gvMovies.PageSize = Convert.ToInt32(Session["TotalRowCount"].ToString());
            //}
            //else
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
                WebHelper.SortDropDownListItems(ddlGenre);

                this.ddlGenre.Items.Insert(0, new ListItem("All", "all"));

                this.lblGenre.Visible = true;
                this.ddlGenre.Visible = true;

                this.ddlGenre.SelectedIndex = 1;
            }
            else
            {
                this.lblGenre.Visible = false;
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
            if (this.ddlGenre.SelectedIndex != 0)
            {
                if (this.lnqMovies.WhereParameters.Count < 3)
                    this.lnqMovies.WhereParameters.Add(new Parameter("medGenre", TypeCode.String, this.ddlGenre.SelectedValue));
                else
                    this.lnqMovies.WhereParameters[2].DefaultValue = this.ddlGenre.SelectedValue;
            }
            else
                this.lnqMovies.WhereParameters.RemoveAt(2);
        }

    }
}