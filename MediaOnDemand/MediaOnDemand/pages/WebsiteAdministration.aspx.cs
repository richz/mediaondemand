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

        string rootVideosFolder = "\\\\Iomega-0a7441\\movies\\";
        string rootMusicFolder = "\\\\Iomega-0a7441\\music\\";
        string moviesFolder = "\\\\Iomega-0a7441\\movies\\Movies";
        string animationFolder = "\\\\Iomega-0a7441\\movies\\Animation";
        string documentariesFolder = "\\\\Iomega-0a7441\\movies\\Documentaries";
        string musicVideosFolder = "\\\\Iomega-0a7441\\movies\\Music Videos";
        string tvFolder = "\\\\Iomega-0a7441\\movies\\TV";
        string basketballFolder = "\\\\Iomega-0a7441\\movies\\Basketball";
        string musicFolder = "\\\\Iomega-0a7441\\music";

        IQueryable<string> fileLocationList;
        List<string> genresList;
        StorageMediaDataContext context;

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
                this.hdnNetworkFolder.Value = this.rootVideosFolder;
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

            if (this.ddlMediaTypes.SelectedValue.Equals("Music"))
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
                        this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
                        this.hdnNetworkFolder.Value = this.musicFolder;
                    }
                    break;
                case "movie":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
                        this.hdnNetworkFolder.Value = this.moviesFolder;
                    }
                    break;
                case "documentary":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
                        this.hdnNetworkFolder.Value = this.documentariesFolder;

                    }
                    break;
                case "tv":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
                        this.hdnNetworkFolder.Value = this.tvFolder;

                    }
                    break;
                case "basketball":
                    {
                        this.hdnMediaType.Value = this.ddlMediaTypes.SelectedValue;
                        this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
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
                case "all":
                    {
                        this.hdnMediaType.Value = "";
                        this.lnqMedia.Where = "";
                        this.hdnNetworkFolder.Value = this.rootMusicFolder + "," + this.rootVideosFolder;
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
            StorageMediaDataContext context = new StorageMediaDataContext();
            StoredMedia media = null;

            // if (Session["updateMode"].ToString().Equals("add"))
            if (this.hdnUpdateMode.Value.Equals("add"))
            {

                media = new StoredMedia
                {
                    medTitle = this.hdnTitle.Value,
                    medLocation = this.hdnLocation.Value,
                    medDateAdded = DateTime.Now,
                    medIsViewable = Convert.ToChar(this.hdnIsViewable.Value),
                    medArtist = this.hdnArtist.Value,
                    medDescription = this.hdnDescription.Value,
                    medGenre = this.hdnGenre.Value,
                    medMediaType = this.hdnMediaType.Value,
                    medDuration = this.hdnDuration.Value.Equals("") ? 0.0f : float.Parse(this.hdnDuration.Value),
                    medAlbum = this.hdnAlbum.Value
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

            string medId = (sender as LinkButton).CommandArgument;

            this.RetriveRowDataToEdit(medId);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showBox();", true);
        }

        protected void btnAddAllFromNetworkFolder_Click(object sender, EventArgs e)
        {
            int duplicates = 0;
            
            //Videos
            String dir = this.rootVideosFolder;
            int totalVideoFiles = Directory.GetFiles(dir, "*.*", SearchOption.AllDirectories).Length;
            StorageMediaDataContext context = new StorageMediaDataContext();

            StoredMedia media;
            string mediaName;
            string genre;
            string mediaType;

            foreach (String filePath in Directory.GetFiles(dir, "*.*", SearchOption.AllDirectories))
            {
                FileInfo file = new FileInfo(filePath);

                if (file.Directory.Name.Equals("musicvideo"))
                {
                    mediaType = "musicvideo";
                    genre = "";
                }
                else
                {

                    if (file.Directory.Parent != null)
                    {
                        mediaType = file.Directory.Parent.Name;

                        if (mediaType.Equals("movie"))
                            genre = file.Directory.Name;
                        else
                            genre = "";
                    }
                    else
                        mediaType = "";
                }
                    if (mediaType.Equals("movie"))
                    {
                        genre = file.Directory.Name;                        
                    }
                    else
                    {
                        genre = "";                        
                    }
                    mediaName = Path.GetFileNameWithoutExtension(filePath);                    

                    if (!StoredMediaRecordExistsByTitle(mediaName))
                    {
                        media = new StoredMedia
                        {
                            medTitle = mediaName,
                            medLocation = filePath,
                            medDateAdded = DateTime.Now,
                            medIsViewable = 'Y',
                            medArtist = "",
                            medDescription = "",
                            medGenre = genre,
                            medMediaType = mediaType,
                            medDuration = 0.0f,
                            medAlbum = "",
                            medFileExt = file.Extension,
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
                        duplicates++;
                
            }

            dir = this.rootMusicFolder;
            int totalMusicFiles = Directory.GetFiles(dir, "*.*", SearchOption.AllDirectories).Length;

            foreach (String filePath in Directory.GetFiles(dir, "*.*", SearchOption.AllDirectories))
            {
                FileInfo file = new FileInfo(filePath);

                    genre = file.Directory.Name;
                    mediaName = file.Name;

                    if (file.Directory.Parent != null)
                    {
                        mediaType = file.Directory.Parent.Name;                                                
                    }
                    else
                        mediaType = "";

                    if (!StoredMediaRecordExistsByTitle(mediaName))
                    {
                        media = new StoredMedia
                        {
                            medTitle = mediaName,
                            medLocation = filePath,
                            medDateAdded = DateTime.Now,
                            medIsViewable = 'Y',
                            medArtist = "",
                            medDescription = "",
                            medGenre = genre,
                            medMediaType = mediaType,
                            medDuration = 0.0f,
                            medAlbum = "",
                            medFileExt = file.Extension,
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
                        duplicates++;
                
            }            

            int totalFiles = totalVideoFiles + totalMusicFiles;

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
                if (sm.medMediaType.Trim().Equals(this.ddlMediaTypes.SelectedValue))
                {
                    context.StoredMedias.DeleteOnSubmit(sm);

                    try
                    {
                        context.SubmitChanges();
                    }
                    catch (Exception ex)
                    {

                    }
                }

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
                this.hdnMedId.Value = row.Cells[12].Text.Trim();
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