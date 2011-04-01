using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using MediaOnDemand;
using MediaOnDemandLibrary;

namespace MediaOnDemand
{
    public partial class OtherVideos : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected string postBackStr;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Title = "Media On Demand - " + User.Identity.Name;

            if (!IsPostBack)
            {
                SetList();
            }

            this.lblFileMessages.Text = "";
        }

        #endregion

        #region Controls Event Handlers

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
                    //DirectoryInfo dir = new DirectoryInfo(sm.medLocation);
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

                this.lblChooseMediaType.Visible = false;
                this.ddlMediaTypes.Visible = false;
            }

        }

        protected void ddlMediaTypes_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddlList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvVideos_DataBound(object sender, EventArgs e)
        {

        }
    }
}