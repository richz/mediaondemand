﻿using System;
using System.Linq;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Drawing;
using System.Windows.Forms;
using System.Threading;

namespace MediaOnDemand
{
    public partial class WebsiteAdministration : System.Web.UI.Page
    {
        #region Private Fields

        ////Main Folders
        //static string rootMediaFilesFolder = HttpContext.Current.Server.MapPath("MediaFiles/");
        //static string videosFolder = HttpContext.Current.Server.MapPath("MediaFiles/videos/");
        //static string audioFolder = HttpContext.Current.Server.MapPath("MediaFiles/Audio/");
        //static string picturesFolder = HttpContext.Current.Server.MapPath("MediaFiles/Pictures/");

        ////Subfolders
        //static string musicFolder = HttpContext.Current.Server.MapPath("MediaFiles/Audio/music");
        //static string moviesFolder = HttpContext.Current.Server.MapPath("MediaFiles/videos/movie/");
        //static string musicVideosFolder = HttpContext.Current.Server.MapPath("MediaFiles/videos/musicvideo/");
        //static string tvFolder = HttpContext.Current.Server.MapPath("MediaFiles/videos/tv/");
        //static string basketballFolder = HttpContext.Current.Server.MapPath("MediaFiles/videos/basketball/");

        //Main Folders
        static string rootMediaFilesFolder = "\\\\Iomega-0a7441\\mediafiles";
        static string videosFolder = "\\\\Iomega-0a7441\\mediafiles\\videos";
        static string audioFolder = "\\\\Iomega-0a7441\\mediafiles\\audio";
        static string picturesFolder = "\\\\Iomega-0a7441\\mediafiles\\pictures";

        //Subfolders
        static string musicFolder = "\\\\Iomega-0a7441\\mediafiles\\audio\\music";
        static string moviesFolder = "\\\\Iomega-0a7441\\mediafiles\\videos\\movie";
        static string musicVideosFolder = "\\\\Iomega-0a7441\\mediafiles\\videos\\musicvideo";
        static string tvFolder = "\\\\Iomega-0a7441\\mediafiles\\videos\\tv";
        static string sportsFolder = "\\\\Iomega-0a7441\\mediafiles\\videos\\sports";
        static DirectoryInfo musicDirectory = new DirectoryInfo(musicFolder);
        static DirectoryInfo moviesDirectory = new DirectoryInfo( moviesFolder);
        static DirectoryInfo musicVideosDirectory = new DirectoryInfo( musicVideosFolder);
        static DirectoryInfo tvDirectory = new DirectoryInfo( tvFolder);
        static DirectoryInfo sportsDirectory = new DirectoryInfo(sportsFolder);

        //Supported file types
        static string[] supportedTypes = new string[] { ".vob", ".avi", ".flv", ".mp4", ".mp3", ".mpg", ".mpeg", ".rm", ".mkv", ".divx", ".m4p", ".m4a" };

        //Set values
        static string networkFolder = "";
        static string mediaType = "";
        static int filesToProcess;
        static int filesProcessed = 0;

        protected string postBackStr;

        #endregion

        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomSessionId"] == null)
            {
                Response.Redirect("~/pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showEditLightBox();", true);

                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");

                this.ddlMediaTypes.SelectedIndex = 1;
                this.hdnMediaType.Value = ddlMediaTypes.SelectedValue;
                //this.lblFolderMessage.ForeColor = Color.Red;
                //this.lblFolderMessage.Text = "";
                this.hdnUpdateMode.Value = "none";

                //this.btnAddNewMediaRow.Text = "Add new media";
                //this.btnApplyChanges.Visible = false;
                this.btnAddNewMediaRow.Enabled = true;

                //default
                this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.moviesFolder;
                this.hdnMediaType.Value = WebsiteAdministration.mediaType = "movie";

                this.gvMedia.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvMedia.Sort("medTitle", SortDirection.Ascending);

                this.btnDeleteAllRecords.Visible = true;

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
            }

            if (this.ddlMediaTypes.SelectedValue.Equals("all"))
                this.lnqMedia.Where = "medMediaType == \" \"";

            gvMedia.DataBind();
        }

        #endregion

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string addFilesFromFolder()
        {
            WebsiteAdministration.filesProcessed = 0;

            //Do work
            string directory = WebsiteAdministration.networkFolder;
            string mediaType = WebsiteAdministration.mediaType;

            int[] fileCount = new int[] { 0, 0, 0 };

            try
            {
                //WebsiteAdministration.filesToProcess = fileCount[2] = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories).Length;
            }
            catch (DirectoryNotFoundException e)
            {
                return "";
            }

            string mediaName;
            string genre = "";
            string artist = "";
            string album = "";
            string mediaT = "";

            foreach (String filePath in Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories))
            {
                FileInfo file = new FileInfo(filePath);
                
                mediaName = Path.GetFileNameWithoutExtension(filePath);
                string fileExt = file.Extension;

                if (supportedTypes.Contains(fileExt.ToLower()))
                {

                    switch (mediaType)
                    {
                        case "movie":
                            {
                                mediaT = mediaType;
                                genre = file.Directory.Parent.Name;

                            } break;
                        case "tv":
                            {
                                mediaT = mediaType;
                                genre = file.Directory.Parent.Parent.Name;
                                album = file.Directory.Parent.Name;
                                break;
                            }
                        case "music":
                            {
                                mediaT = mediaType;
                                artist = file.Directory.Parent.Name;
                                album = file.Directory.Name;
                            }
                            break;
                        case "sports":
                            {
                                mediaT = mediaType;
                                genre = file.Directory.Parent.Parent.Name;
                            }
                            break;
                        case "musicvideo":
                            {
                                mediaT = mediaType;
                                genre = file.Directory.Parent.Name;
                                album = file.Directory.Name;
                            }
                            break;
                        case "all":
                            {
                                mediaT = GetMediaTypeForFile(file);
                            }
                            break;
                    }

                    bool recordExists = false;
                    StorageMediaDataContext context = new StorageMediaDataContext();

                    foreach (StoredMedia sm in context.StoredMedias)
                        if (sm.medTitle.Trim().Equals(mediaName))
                            recordExists = true;

                    if (!recordExists)
                    {
                        try
                        {
                            StoredMedia media = new StoredMedia
                            {
                                medTitle = mediaName,
                                medLocation = filePath,
                                medDateAdded = DateTime.Now,
                                medIsViewable = 'Y',
                                medArtist = artist,
                                medDescription = "",
                                medGenre = genre,
                                medMediaType = mediaT,
                                medDuration = new float(),
                                medAlbum = album,
                                medFileExt = fileExt,
                            };

                            context.StoredMedias.InsertOnSubmit(media);

                            context.SubmitChanges();

                            fileCount[0]++;

                        }
                        catch (Exception ex)
                        {
                        }
                    }
                    else
                    {
                        fileCount[1]++;
                    }
                }
            }

            return "All finished!";
        }

        public static string GetMediaTypeForFile(FileInfo file)
        {
            string mediaT = "";
            FileInfo[] files;

            files = musicDirectory.GetFiles(file.FullName, SearchOption.AllDirectories);
            if (files.Length > 0)
                mediaT = "music";

            files = moviesDirectory.GetFiles(file.FullName, SearchOption.AllDirectories);
            if (files.Length > 0)
                mediaT = "movie";

            files = tvDirectory.GetFiles(file.FullName, SearchOption.AllDirectories);
            if (files.Length > 0)
                mediaT = "tv";

            files = musicVideosDirectory.GetFiles(file.FullName, SearchOption.AllDirectories);
            if (files.Length > 0)
                mediaT = "musicvideos";

            files = sportsDirectory.GetFiles(file.FullName, SearchOption.AllDirectories);
            if (files.Length > 0)
                mediaT = "sports";

            return mediaT;
        }
        
        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string deleteAllRecordsForType()
        {
            WebsiteAdministration.filesProcessed = 0;

            StorageMediaDataContext context = new StorageMediaDataContext();

            if (!WebsiteAdministration.mediaType.Equals("all"))
            {

                foreach (StoredMedia sm in context.StoredMedias)
                {
                    if (sm.medMediaType.Trim().Equals(WebsiteAdministration.mediaType))
                    {
                        context.StoredMedias.DeleteOnSubmit(sm);
                    }
                }
            }
            else
            {
                context.StoredMedias.DeleteAllOnSubmit(context.StoredMedias);
            }

            try
            {
                context.SubmitChanges();
            }
            catch (Exception ex)
            {
                return "Failed";
            }

            return "All finished!";
        }

        #region Control Event Handlers

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Red;
            //this.lblFolderMessage.Text = "";

            // Reset Page Index for Grid
            this.gvMedia.PageIndex = 0;

            this.hdnMediaType.Value = WebsiteAdministration.mediaType = this.ddlMediaTypes.SelectedValue;

            if (!this.ddlMediaTypes.SelectedValue.Equals("all"))
                this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";
            else
                this.lnqMedia.Where = "";

            switch (this.ddlMediaTypes.SelectedValue)
            {
                case "all":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.rootMediaFilesFolder;
                    }
                    break;
                case "music":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.musicFolder;

                        // this.lnqMedia.Where = "medMediaType == \"music\"";                        
                        //this.gvMedia.Columns[10].Visible = true;
                        //this.gvMedia.Columns[13].Visible = false;
                    }
                    break;
                case "movie":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.moviesFolder;

                        //this.lnqMedia.Where = "medMediaType == \"movie\"";
                        //this.gvMedia.Columns[13].Visible = true;
                        //this.gvMedia.Columns[10].Visible = false;
                    }
                    break;
                case "tv":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.tvFolder;
                        //this.lnqMedia.Where = "medMediaType == \"tv\"";
                        //this.gvMedia.Columns[13].Visible = true;
                        //this.gvMedia.Columns[10].Visible = false;
                    }
                    break;
                case "sports":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.sportsFolder;
                        //this.lnqMedia.Where = "medMediaType == \"basketball\"";                        
                        //this.gvMedia.Columns[13].Visible = true;
                        //this.gvMedia.Columns[10].Visible = false;
                    }
                    break;
                case "musicvideo":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.musicVideosFolder;
                        //this.lnqMedia.Where = "medMediaType == \"musicvideo\"";                        
                        //this.gvMedia.Columns[13].Visible = true;
                        //this.gvMedia.Columns[10].Visible = false;
                    }
                    break;
            }

            //WebsiteAdministration.filesToProcess = Directory.GetFiles(WebsiteAdministration.networkFolder, "*.*", SearchOption.AllDirectories).Length;

            this.ddlPageSize.SelectedIndex = 0;
            this.gvMedia.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].ToString());
            this.gvMedia.PageIndex = 0;
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

                this.hdnUpdateMode.Value = "add";
                //this.btnAddNewMediaRow.Text = "Cancel";
                //this.btnApplyChanges.Visible = true;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showEditLightBox();", true);
            }
            else
            {
                //this.btnAddNewMediaRow.Text = "Add new media";
                //this.btnApplyChanges.Visible = false;
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
                string title = this.hdnTitle.Value.Trim();
                string location = this.hdnLocation.Value.Trim();
                char isViewable = Convert.ToChar(this.hdnIsViewable.Value.Trim());
                string artist = this.hdnArtist.Value.Trim();
                string description = this.hdnDescription.Value.Trim();
                string genre = this.hdnGenre.Value.Trim();
                string mediaType = this.hdnMediaType.Value.Trim();
                float duration = this.hdnDuration.Value.Equals("") ? float.Parse("0.00") : float.Parse(this.hdnDuration.Value.Trim());
                string album = this.hdnAlbum.Value.Trim();
                string videoType = this.hdnVideoType.Value.Trim();
                string id = this.hdnMedId.Value.Trim();

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
                row.medVideoType = videoType;

                try
                {
                    context.SubmitChanges();
                }
                catch (Exception ex)
                {
                }
            }
            //this.btnApplyChanges.Visible = false;
            //this.btnAddNewMediaRow.Text = "Add new media";
            this.btnAddNewMediaRow.Visible = true;
            this.hdnUpdateMode.Value = "none";

            this.gvMedia.DataBind();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            this.hdnUpdateMode.Value = "edit";

            this.hdnMedId.Value = (sender as LinkButton).CommandArgument;

            this.RetriveRowDataToEdit(this.hdnMedId.Value);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showEditLightBox();", true);
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
                medArtist = artist,
                medDescription = "",
                medGenre = genre,
                medMediaType = mediaType,
                medDuration = duration,
                medAlbum = album,
                medFileExt = fileExt,
            };

            context.StoredMedias.InsertOnSubmit(media);

            context.SubmitChanges();
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

            //Hide Page Size Controls if no records, else show
            if (GetGridViewRecordCountByCurrentMediaType() == 0)
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                //this.btnDeleteAllRecords.Visible = false;
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }

            //this.lblFolderMessage.Text = "";
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Reset status labels Text
            //this.lblFolderMessage.Text = "";

            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.gvMedia.PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                this.gvMedia.PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.gvMedia.PageIndex = 0;
        }

        #endregion

        #region Helper Methods

        private void RetriveRowDataToEdit(string mediaId)
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medId == Convert.ToInt32(mediaId))
                {
                    this.hdnTitle.Value = sm.medTitle.Trim();
                    this.hdnLocation.Value = sm.medLocation.Trim();
                    this.hdnIsViewable.Value = sm.medIsViewable.ToString().Trim();
                    this.hdnArtist.Value = sm.medArtist != null ? sm.medArtist.Trim() : "";
                    this.hdnDescription.Value = sm.medDescription.Trim() != null ? sm.medDescription : "";
                    this.hdnGenre.Value = sm.medGenre.Trim();
                    this.hdnMediaType.Value = sm.medMediaType.Trim();
                    this.hdnDuration.Value = sm.medDuration.ToString().Trim();
                    this.hdnAlbum.Value = sm.medAlbum.Trim();
                    this.hdnFileExt.Value = sm.medFileExt.Trim();

                    return;
                }
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

            iTotalRecords = Convert.ToInt32(Session["TotalRowCount"].ToString());

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
            //this.lblFolderMessage.ForeColor = Color.Blue;
            //this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Red;
            //this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void movieWatcher_Created(object sender, FileSystemEventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Green;
            //this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Renamed(object sender, RenamedEventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Blue;
            //this.lblFolderMessage.Text += "\nA file was renamed in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Red;
            //this.lblFolderMessage.Text += "\nA file was deleted in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        void musicWatcher_Created(object sender, FileSystemEventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Green;
            //this.lblFolderMessage.Text += "\nA file was created in the " + (sender as FileSystemWatcher).Path + " folder";
        }

        #endregion

        protected void lnqMedia_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount > 0)
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
                //this.btnDeleteAllRecords.Visible = true;
            }
            else
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
                //this.btnDeleteAllRecords.Visible = false;
            }


        }

        protected void gvMedia_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            this.gvMedia.DataBind();
        }

        protected void gvMedia_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvMedia_DataBound(object sender, EventArgs e)
        {
            GridView gvMedia = (sender as GridView);

            if (gvMedia.Rows.Count == 0)
                ;
        }
    }
}