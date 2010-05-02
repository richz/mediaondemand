using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;

namespace MediaOnDemand
{
    public partial class WebsiteAdministration : System.Web.UI.Page
    {
        #region Private Fields

        //Main Folders
        string rootMediaFilesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/");
        string videosFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/");
        string musicFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/music/");
        string picturesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Pictures/");

        //Subfolders
        string moviesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/movie/");
        string documentariesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/documentary/");
        string musicVideosFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/musicvideo/");
        string tvFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/tv/");
        string basketballFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/basketball/");

        #endregion

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.ddlMediaTypes.SelectedIndex = 0;
                this.hdnMediaType.Value = ddlMediaTypes.SelectedValue;
                this.lblFolderMessage.ForeColor = Color.Red;
                this.lblFolderMessage.Text = "";
                this.hdnUpdateMode.Value = "none";

                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnApplyChanges.Visible = false;
                this.btnAddNewMediaRow.Enabled = true;
                this.hdnNetworkFolder.Value = this.videosFolder;
                this.gvMedia.Sort("medTitle", SortDirection.Ascending);
                UpdateRecordCount();

                //if (Directory.Exists(this.rootVideosFolder) && Directory.Exists(this.rootMusicFolder))
                //{
                //    //
                //    //Create a new FileSystemWatcher.
                //    FileSystemWatcher movieWatcher = new FileSystemWatcher();
                //    //Subscribe to the Created event.
                //    movieWatcher.Created += new FileSystemEventHandler(movieWatcher_Created);
                //    movieWatcher.Deleted += new FileSystemEventHandler(movieWatcher_Deleted);
                //    movieWatcher.Renamed += new RenamedEventHandler(movieWatcher_Renamed);

                //    //Set the path
                //    movieWatcher.Path = movieFolder;

                //    //Enable the FileSystemWatcher events.
                //    movieWatcher.EnableRaisingEvents = true;
                //    //
                //    //Create a new FileSystemWatcher.
                //    FileSystemWatcher musicWatcher = new FileSystemWatcher();
                //    //Subscribe to the Created event.
                //    musicWatcher.Created += new FileSystemEventHandler(musicWatcher_Created);
                //    musicWatcher.Deleted += new FileSystemEventHandler(musicWatcher_Deleted);
                //    musicWatcher.Renamed += new RenamedEventHandler(musicWatcher_Renamed);

                //    //Set the path
                //    musicWatcher.Path = musicFolder;

                //    //Enable the FileSystemWatcher events.
                //    musicWatcher.EnableRaisingEvents = true;
                //    //                    
                //}
                //else
                //{
                //    //Missing Directories
                //}

                //this.AddNewMediaPanel.Visible = false;
                this.btnAddNewMediaRow.Enabled = true;

                //Hide Page Size Controls if no records, else show
                if (GetGridViewRecordCountByCurrentMediaType() == 0)
                {
                    this.lblPageSize.Visible = false;
                    this.ddlPageSize.Visible = false;
                }
                else
                {
                    this.lblPageSize.Visible = true;
                    this.ddlPageSize.Visible = true;
                }

            }

            if (this.ddlMediaTypes.SelectedValue.Equals("music"))
            {
                this.gvMedia.Columns[10].Visible = true;
                this.gvMedia.Columns[13].Visible = false;
            }
            else
            {
                this.gvMedia.Columns[13].Visible = true;
                this.gvMedia.Columns[10].Visible = false;
            }
        }

        #endregion

        #region Control Event Handlers

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Red;
            this.lblFolderMessage.Text = "";

            // Reset Page Index for Grid
            this.gvMedia.PageIndex = 0;

            switch (this.ddlMediaTypes.SelectedValue)
            {
                case "music":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"music\"";
                        this.hdnNetworkFolder.Value = this.musicFolder;
                    }
                    break;
                case "movie":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"movie\"";
                        this.hdnNetworkFolder.Value = this.moviesFolder;
                    }
                    break;
                case "documentary":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"documentary\"";
                        this.hdnNetworkFolder.Value = this.documentariesFolder;

                    }
                    break;
                case "tv":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"tv\"";
                        this.hdnNetworkFolder.Value = this.tvFolder;

                    }
                    break;
                case "basketball":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"basketball\"";
                        this.hdnNetworkFolder.Value = this.basketballFolder;

                    }
                    break;
                case "musicvideo":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"musicvideo\"";
                        this.hdnNetworkFolder.Value = this.musicVideosFolder;

                    }
                    break;
            }

            UpdateRecordCount();
        }

        protected void btnAddNewMediaRow_Click(object sender, EventArgs e)
        {
            if (this.hdnUpdateMode.Value.Equals("none"))
            {
                // Reset Hidden fields
                this.hdnTitle.Value = "";
                this.hdnLocation.Value = "";
                this.hdnIsViewable.Value = "";
                this.hdnArtist.Value = "";
                this.hdnDescription.Value = "";
                this.hdnGenre.Value = "";
                this.hdnDuration.Value = "";
                this.hdnAlbum.Value = "";
                this.hdnMedId.Value = "";
                this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;

                //Session["updateMode"] = "add";
                this.hdnUpdateMode.Value = "add";
                this.btnAddNewMediaRow.Text = "Cancel";
                this.btnApplyChanges.Visible = true;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showBox();", true);
            }
            else
            {
                this.btnAddNewMediaRow.Text = "Add new media";
                this.btnApplyChanges.Visible = false;

                //Session["updateMode"] = "none";
                this.hdnUpdateMode.Value = "none";
            }
        }

        protected void btnApplyChanges_Click(object sender, EventArgs e)
        {
            //Add new media row
            if (this.hdnUpdateMode.Value.Equals("add"))
            {
                float duration = this.hdnDuration.Value.Equals("") ? 0.0f : float.Parse(this.hdnDuration.Value);
                FileInfo file = new FileInfo(this.hdnLocation.Value);
                string fileExt = file.Extension;

                try
                {
                    this.addNewMediaRecord(this.hdnTitle.Value, this.hdnLocation.Value, Convert.ToChar(this.hdnIsViewable.Value), this.hdnArtist.Value, this.hdnDescription.Value, this.hdnGenre.Value, this.hdnMediaType.Value, duration, this.hdnAlbum.Value, fileExt);
                }
                catch (Exception ex)
                { 
                }                
            }
            else //Edit
            {
                string title = this.hdnTitle.Value;
                string location = this.hdnLocation.Value;
                char isViewable = Convert.ToChar(this.hdnIsViewable.Value);
                string artist = this.hdnArtist.Value;
                string description = this.hdnDescription.Value;
                string genre = this.hdnGenre.Value;
                string mediaType = this.hdnMediaType.Value;
                float duration = this.hdnDuration.Value.Equals("") ? float.Parse("0.00") : float.Parse(this.hdnDuration.Value);
                string album = this.hdnAlbum.Value;
                string id = this.hdnMedId.Value;

                StorageMediaDataContext context = new StorageMediaDataContext();

                StoredMedia row =
                (from StoredMedia in context.StoredMedias
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

            //this.AddNewMediaPanel.Visible = false;
            this.btnApplyChanges.Visible = false;
            this.btnAddNewMediaRow.Text = "Add new media";
            this.btnAddNewMediaRow.Visible = true;
            this.hdnUpdateMode.Value = "none";

            this.gvMedia.DataBind();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            //Session["updateMode"] = "edit";
            this.hdnUpdateMode.Value = "edit";

            this.btnAddNewMediaRow.Text = "Cancel";
            this.btnApplyChanges.Visible = true;

            this.hdnMedId.Value = (sender as LinkButton).CommandArgument;

            this.RetriveRowDataToEdit(this.hdnMedId.Value);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showBox();", true);
        }

        private void addNewMediaRecord(string mediaName, string filePath, char isViewable, string artist, string description, string genre, string mediaType, float duration, string album, string fileExt)
        {
            StorageMediaDataContext context = new StorageMediaDataContext();
            StoredMedia media = new StoredMedia
            {
                medTitle = mediaName,
                medLocation = filePath,
                medDateAdded = DateTime.Now,
                medIsViewable = 'Y',
                medArtist = "",
                medDescription = "",
                medGenre = genre,
                medMediaType = mediaType,
                medDuration = duration,//0.0f,
                medAlbum = album,
                medFileExt = fileExt,
            };

            context.StoredMedias.InsertOnSubmit(media);

            context.SubmitChanges();
        }

        private int[] addFilesFromFolder(string directory, string mediaType)
        {
            int[] fileCount = new int[] { 0, 0, 0 };
            fileCount[2] = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories).Length;

            string mediaName;
            string genre;

            foreach (String filePath in Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories))
            {
                FileInfo file = new FileInfo(filePath);
                mediaName = Path.GetFileNameWithoutExtension(filePath);

                if (file.Directory.Parent.Name.Equals("movie"))
                {

                    mediaType = file.Directory.Parent.Name;

                    genre = file.Directory.Name;
                }
                else
                {

                    mediaType = file.Directory.Parent.Name;

                    genre = "";
                }


                if (!StoredMediaRecordExistsByTitle(mediaName))
                {
                    try
                    {
                        this.addNewMediaRecord(mediaName, filePath, 'Y', "", "", genre, mediaType, 0.0f, "", file.Extension);

                        fileCount[0]++;

                    }
                    catch (Exception ex)
                    {
                    }
                }
                else
                    fileCount[1]++;
            }

            return fileCount;
        }

        protected void btnAddAllFromNetworkFolder_Click(object sender, EventArgs e)
        {
            int duplicates = 0;
            int filesAdded = 0;
            int totalFiles = 0;

            //Movies
            int[] filesCount = addFilesFromFolder(moviesFolder, "movie");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            //TV
            filesCount = addFilesFromFolder(tvFolder, "tv");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            //Basketball
            filesCount = addFilesFromFolder(basketballFolder, "basketball");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            //Documentary
            filesCount = addFilesFromFolder(documentariesFolder, "documentary");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            //Music Videos
            filesCount = addFilesFromFolder(musicVideosFolder, "musicvideo");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            //Music
            filesCount = addFilesFromFolder(musicFolder, "music");
            filesAdded += filesCount[0];
            duplicates += filesCount[1];
            totalFiles += filesCount[2];

            if (duplicates == totalFiles)
            {
                this.lblFolderMessage.ForeColor = Color.Red;
                this.lblFolderMessage.Text = "All " + duplicates + " files were duplicates, no new files were added";
            }
            else if (duplicates > 0 && duplicates < totalFiles)
            {
                this.lblFolderMessage.ForeColor = Color.Red;
                this.lblFolderMessage.Text = "Found " + duplicates + " duplicate(s), only " + (totalFiles - duplicates) + " files were added";
            }
            else
            {
                this.lblFolderMessage.ForeColor = Color.Green;
                this.lblFolderMessage.Text = "All " + totalFiles + " file(s) were added";
            }

            //Hide Page Size Controls if no records, else show
            if (GetGridViewRecordCountByCurrentMediaType() == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }

            this.gvMedia.DataBind();
            UpdateRecordCount();
        }

        protected void gvMedia_PageIndexChanged(object sender, EventArgs e)
        {
            UpdateRecordCount();
        }

        protected void gvMedia_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void btnDeleteAllRecords_Click(object sender, EventArgs e)
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                //if (sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue))
                //{
                    context.StoredMedias.DeleteOnSubmit(sm);

                    try
                    {
                        context.SubmitChanges();
                    }
                    catch (Exception ex)
                    {

                    }
                //}

            this.gvMedia.DataBind();
            UpdateRecordCount();

            //Hide Page Size Controls if no records, else show
            if (GetGridViewRecordCountByCurrentMediaType() == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }

            this.lblFolderMessage.Text = "";
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Reset status labels Text
            this.lblFolderMessage.Text = "";

            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMedia.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                this.gvMedia.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.gvMedia.PageIndex = 0;
            UpdateRecordCount();
        }

        protected void gvMedia_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void gvMedia_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            //Hide Page Size Controls if no records, else show
            if (GetGridViewRecordCountByCurrentMediaType() == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }
        }

        #endregion

        #region Helper Methods

        private void RetriveRowDataToEdit(string rowId)
        {
            int index = IndexOfRowByDataKey(rowId);

            GridViewRow row = (index >= 0) ? this.gvMedia.Rows[index] : null;

            if (row != null)
            {
                this.hdnTitle.Value = row.Cells[1].Text.Trim();
                this.hdnLocation.Value = row.Cells[2].Text.Trim();
                this.hdnIsViewable.Value = row.Cells[4].Text.Trim();
                this.hdnArtist.Value = row.Cells[6].Text.Trim();
                this.hdnDescription.Value = row.Cells[3].Text.Trim();
                this.hdnGenre.Value = row.Cells[7].Text.Trim();
                this.hdnMediaType.Value = row.Cells[8].Text.Trim();
                this.hdnDuration.Value = row.Cells[9].Text.Trim();
                this.hdnAlbum.Value = row.Cells[10].Text.Trim().Equals("&nbsp;") ? "" : row.Cells[10].Text.Trim();
            }
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

        private void UpdateRecordCount()
        {
            //Record Per Page Display
            int iTotalRecords = 0;

            iTotalRecords = this.GetGridViewRecordCountByCurrentMediaType();

            int iEndRecord = gvMedia.PageSize * (gvMedia.PageIndex + 1);
            int iStartsRecods = iEndRecord - gvMedia.PageSize;

            if (iEndRecord > iTotalRecords)
                iEndRecord = iTotalRecords;

            if (iStartsRecods == 0 || iStartsRecods % gvMedia.PageSize == 0) iStartsRecods += 1;
            if (iEndRecord == 0) iEndRecord = iTotalRecords;

            if (iTotalRecords == 0)
                this.lblRecordCount.Text = "";
            else
                this.lblRecordCount.Text = iStartsRecods + " to " + iEndRecord.ToString() + " of " + iTotalRecords.ToString();

        }

        private bool StoredMediaRecordExistsByTitle(string title)
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medTitle.Trim().Equals(title))
                    return true;

            return false;
        }

        private int GetGridViewRecordCountByCurrentMediaType()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var recs =

                (from StoredMedia in context.StoredMedias
                 where StoredMedia.medMediaType == this.ddlMediaTypes.SelectedValue
                 select StoredMedia
                );

            return recs.Count();
        }

        #endregion

        #region Folder Watcher Event Handlers

        void movieWatcher_Renamed(object sender, RenamedEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Blue;
            this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Red;
            this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Created(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Green;
            this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Renamed(object sender, RenamedEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Blue;
            this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Red;
            this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Created(object sender, FileSystemEventArgs e)
        {
            this.lblFolderMessage.ForeColor = Color.Green;
            this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        #endregion
    }
}