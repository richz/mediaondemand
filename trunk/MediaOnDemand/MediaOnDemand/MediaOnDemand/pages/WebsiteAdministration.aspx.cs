using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class WebsiteAdministration : System.Web.UI.Page
    {
        private bool addMode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnApplyChanges.Visible = false;
                this.addMode = false;
                this.btnAddNewMediaRow.Enabled = true;
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

        }

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {           

            if (this.ddlMediaTypes.SelectedValue == "all")
                this.lnqMedia.Where = "";
            else
                this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
                
        }

        protected void gvMedia_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.btnAddNewMediaRow.Enabled = false;
        }

        protected void gvMedia_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.gvMedia.ShowFooter = false;
        }

        protected void gvMedia_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            this.gvMedia.ShowFooter = false;
        }

        protected void btnAddNewMediaRow_Click(object sender, EventArgs e)
        {            
            if (this.btnAddNewMediaRow.Text.Equals("Add new media"))
            {
                this.addMode = true;
                this.btnAddNewMediaRow.Text = "Cancel";
                this.btnApplyChanges.Visible = true;
                this.gvMedia.ShowFooter = true;
            }
            else
            {
                this.addMode = false;
                this.btnAddNewMediaRow.Text = "Add new media";
                this.gvMedia.ShowFooter = false;
                this.btnApplyChanges.Visible = false;
            }

            //Hide columns when in add mode, else show them
            if (this.addMode)
            {
                this.gvMedia.Columns[0].Visible = false;
                this.gvMedia.Columns[this.gvMedia.Columns.Count - 1].Visible = false;
            }
            else
            {
                this.gvMedia.Columns[0].Visible = true;
                this.gvMedia.Columns[this.gvMedia.Columns.Count - 1].Visible = true;
            }
        }

        protected void btnApplyChanges_Click(object sender, EventArgs e)
        {
            //Hide Edit, Delete and Select Buttons
            this.gvMedia.Columns[0].Visible = true;
            this.gvMedia.Columns[this.gvMedia.Columns.Count - 1].Visible = true;

            //Add new media row
            StorageMediaDataContext context = new StorageMediaDataContext();

            StoredMedia media = new StoredMedia
            {
                medTitle = (this.gvMedia.FooterRow.FindControl("txtTitle") as TextBox).Text,
                medLocation = (this.gvMedia.FooterRow.FindControl("txtLocation") as TextBox).Text,
                medDateAdded = DateTime.Now,
                medIsViewable = (this.gvMedia.FooterRow.FindControl("txtTitle") as TextBox).Text.ToCharArray()[0],
                medArtist = (this.gvMedia.FooterRow.FindControl("txtArtist") as TextBox).Text,
                medDescription = (this.gvMedia.FooterRow.FindControl("txtDescription") as TextBox).Text,
                medGenre = (this.gvMedia.FooterRow.FindControl("txtGenre") as TextBox).Text,
                medMediaType = (this.gvMedia.FooterRow.FindControl("txtMediaType") as TextBox).Text,
                medDuration = float.Parse((this.gvMedia.FooterRow.FindControl("txtDuration") as TextBox).Text),
                medAlbum = (this.gvMedia.FooterRow.FindControl("txtAlbum") as TextBox).Text
            };

            context.StoredMedias.InsertOnSubmit(media);

            try
            {
                context.SubmitChanges();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
                // Make some adjustments.
                // ...
                // Try again.
                context.SubmitChanges();
            }


        }
    }
}