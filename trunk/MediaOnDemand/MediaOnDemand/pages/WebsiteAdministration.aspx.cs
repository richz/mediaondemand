using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MediaOnDemand
{
    public partial class WebsiteAdministration : System.Web.UI.Page
    {
        SessionParameter isAddMode;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.lblFolderMessage.Text = "";                
                this.isAddMode = new SessionParameter("updateMode", "none");
                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnApplyChanges.Visible = false;
                this.btnAddNewMediaRow.Enabled = true;

                //
                //Create a new FileSystemWatcher.
                FileSystemWatcher movieWatcher = new FileSystemWatcher();
                //Subscribe to the Created event.
                movieWatcher.Created += new FileSystemEventHandler(movieWatcher_Created);
                movieWatcher.Deleted += new FileSystemEventHandler(movieWatcher_Deleted);
                movieWatcher.Renamed += new RenamedEventHandler(movieWatcher_Renamed);

                //Set the path
                movieWatcher.Path = "\\\\Iomega-0a7441\\movies\\DVDs";

                //Enable the FileSystemWatcher events.
                movieWatcher.EnableRaisingEvents = true;
                //
                //Create a new FileSystemWatcher.
                FileSystemWatcher musicWatcher = new FileSystemWatcher();
                //Subscribe to the Created event.
                musicWatcher.Created += new FileSystemEventHandler(musicWatcher_Created);
                musicWatcher.Deleted += new FileSystemEventHandler(musicWatcher_Deleted);
                musicWatcher.Renamed += new RenamedEventHandler(musicWatcher_Renamed);

                //Set the path
                musicWatcher.Path = "\\\\Iomega-0a7441\\music";

                //Enable the FileSystemWatcher events.
                musicWatcher.EnableRaisingEvents = true;
                //

                this.AddNewMediaPanel.Visible = false;
            }

            if (this.gvMedia.EditIndex < 0)
                this.btnAddNewMediaRow.Enabled = true;
        }

        void movieWatcher_Renamed(object sender, RenamedEventArgs e)
        {
           this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
           this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Created(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Renamed(object sender, RenamedEventArgs e)
        {
            this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Created(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }      

        //protected void btnUpload_Click(object sender, EventArgs e)
        //{

        //}

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.ddlMediaTypes.SelectedValue == "all")
                this.lnqMedia.Where = "";
            else
                this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";

        }

        protected void gvMedia_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {

        }

        protected void btnAddNewMediaRow_Click(object sender, EventArgs e)
        {
            if (this.btnAddNewMediaRow.Text.Equals("Add new media"))
            {
                this.btnAddNewMediaRow.Text = "Cancel";
                this.btnApplyChanges.Visible = true;
                this.AddNewMediaPanel.Visible = true;

                Session["updateMode"] = "add";
            }
            else
            {
                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnApplyChanges.Visible = false;
                this.AddNewMediaPanel.Visible = false;
                Session["updateMode"] = "none";
            }
        }

        protected void btnApplyChanges_Click(object sender, EventArgs e)
        {
            //Add new media row
            StorageMediaDataContext context = new StorageMediaDataContext();
            StoredMedia media = null;

            if (Session["updateMode"].ToString().Equals("add"))
            {

                media = new StoredMedia
                {
                    medTitle = (this.AddNewMediaPanel.FindControl("txtTitle") as TextBox).Text,
                    medLocation = (this.AddNewMediaPanel.FindControl("txtLocation") as TextBox).Text,
                    medDateAdded = DateTime.Now,
                    medIsViewable = Convert.ToChar((this.AddNewMediaPanel.FindControl("ddlIsViewable") as DropDownList).SelectedValue),
                    medArtist = (this.AddNewMediaPanel.FindControl("txtArtist") as TextBox).Text,
                    medDescription = (this.AddNewMediaPanel.FindControl("txtDescription") as TextBox).Text,
                    medGenre = (this.AddNewMediaPanel.FindControl("txtGenre") as TextBox).Text,
                    medMediaType = (this.AddNewMediaPanel.FindControl("ddlMediaType") as DropDownList).SelectedValue,
                    medDuration = (this.AddNewMediaPanel.FindControl("txtDuration") as TextBox).Text.Equals("") ? float.Parse("0.00") : float.Parse((this.AddNewMediaPanel.FindControl("txtDuration") as TextBox).Text),
                    medAlbum = (this.AddNewMediaPanel.FindControl("txtAlbum") as TextBox).Text
                };

                context.StoredMedias.InsertOnSubmit(media);

                try
                {
                    context.SubmitChanges();
                }
                catch (Exception ex)
                {

                }

            }
            else
            {
                string title = (this.AddNewMediaPanel.FindControl("txtTitle") as TextBox).Text;
                string location = (this.AddNewMediaPanel.FindControl("txtLocation") as TextBox).Text;
                char isViewable = Convert.ToChar((this.AddNewMediaPanel.FindControl("ddlIsViewable") as DropDownList).SelectedValue);
                string artist = (this.AddNewMediaPanel.FindControl("txtArtist") as TextBox).Text;
                string description = (this.AddNewMediaPanel.FindControl("txtDescription") as TextBox).Text;
                string genre = (this.AddNewMediaPanel.FindControl("txtGenre") as TextBox).Text;
                string mediaType = (this.AddNewMediaPanel.FindControl("ddlMediaType") as DropDownList).SelectedValue;
                float duration = (this.AddNewMediaPanel.FindControl("txtDuration") as TextBox).Text.Equals("") ? float.Parse("0.00") : float.Parse((this.AddNewMediaPanel.FindControl("txtDuration") as TextBox).Text);
                string album = (this.AddNewMediaPanel.FindControl("txtAlbum") as TextBox).Text;
                string id = (this.AddNewMediaPanel.FindControl("lblMedId") as Label).Text;

                StoredMedia row =
                (    from StoredMedia in context.StoredMedias
                    where StoredMedia.medId == Int32.Parse(id)
                    select StoredMedia
                ).First();

                row.medTitle = title;
                row.medLocation = location;
                row.medIsViewable = isViewable;
                row.medArtist = artist;
                row.medDescription = description;
                row.medGenre = genre;
                row.medMediaType = mediaType;
                row.medDuration = duration;
                row.medAlbum = album;

                try
                {
                    context.SubmitChanges();
                }
                catch (Exception ex)
                {

                }
                
                
            }
            
                this.AddNewMediaPanel.Visible = false;
                this.btnApplyChanges.Visible = false;
                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnAddNewMediaRow.Visible = true;

                this.gvMedia.DataBind();
        }

        private void RetriveRowDataToEdit(string rowId)
        {
            int index = IndexOfRowByDataKey(rowId);

            GridViewRow row = (index >= 0) ? this.gvMedia.Rows[index] : null;

            if (row != null)
            {
                (this.AddNewMediaPanel.FindControl("txtTitle") as TextBox).Text = row.Cells[1].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtLocation") as TextBox).Text = row.Cells[2].Text.Trim();
                (this.AddNewMediaPanel.FindControl("ddlIsViewable") as DropDownList).SelectedValue = row.Cells[4].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtArtist") as TextBox).Text = row.Cells[6].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtDescription") as TextBox).Text = row.Cells[3].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtGenre") as TextBox).Text = row.Cells[7].Text.Trim();
                (this.AddNewMediaPanel.FindControl("ddlMediaType") as DropDownList).SelectedValue = row.Cells[8].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtDuration") as TextBox).Text = row.Cells[9].Text.Trim();
                (this.AddNewMediaPanel.FindControl("txtAlbum") as TextBox).Text = row.Cells[10].Text.Trim().Equals("&nbsp;")? "":row.Cells[10].Text.Trim();
                (this.AddNewMediaPanel.FindControl("lblMedId") as Label).Text = row.Cells[12].Text.Trim();
            }
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            Session["updateMode"] = "edit";
            this.btnAddNewMediaRow.Visible = false;
            this.btnApplyChanges.Visible = true;
            this.AddNewMediaPanel.Visible = true;

            string medId = (sender as LinkButton).CommandArgument;

            this.RetriveRowDataToEdit(medId);
        }

        private int IndexOfRowByDataKey(string medId)
        {
            foreach (GridViewRow row in this.gvMedia.Rows)
            {
                if (Convert.ToInt32(this.gvMedia.DataKeys[row.RowIndex].Value) == Convert.ToInt32(medId))
                    return row.RowIndex;
            }

            return -1;
        }

    }
    //public class FolderWatcher
    //{
    //    string folder;

    //    public FolderWatcher(string folderPath)
    //    {
    //        //Create a new FileSystemWatcher.
    //        FileSystemWatcher watcher = new FileSystemWatcher();

    //        //Subscribe to the Created event.
    //        watcher.Created += new FileSystemEventHandler(watcher_FileCreated);
    //        watcher.Deleted += new FileSystemEventHandler(watcher_Deleted);
    //        watcher.Renamed += new RenamedEventHandler(watcher_Renamed);

    //        //Set the path to C:\Temp\
    //        this.folder = watcher.Path = folderPath;

    //        //Enable the FileSystemWatcher events.
    //        watcher.EnableRaisingEvents = true;
    //    }

    //    void watcher_Renamed(object sender, RenamedEventArgs e)
    //    {
    //        //System.Windows.Forms.MessageBox.Show("A file has been renamed!");
    //    }

    //    void watcher_Deleted(object sender, FileSystemEventArgs e)
    //    {
    //        //System.Windows.Forms.MessageBox.Show("A new file has been deleted!");
    //    }

    //    void watcher_FileCreated(object sender, FileSystemEventArgs e)
    //    {
    //        //A new .TXT file has been created in C:\Temp\
    //        //System.Windows.Forms.MessageBox.Show("A new file has been created!");
    //    }

    //    public override string ToString()
    //    {
    //        return this.folder;
    //    }
    //}
}