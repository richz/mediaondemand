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

        //Main Folders
        static string rootMediaFilesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/");
        static string videosFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/");
        static string audioFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Audio/");
        static string picturesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Pictures/");

        //Subfolders
        static string musicFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Audio/music");
        static string moviesFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/movie/");
        static string musicVideosFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/musicvideo/");
        static string tvFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/tv/");
        static string basketballFolder = HttpContext.Current.Server.MapPath("~/MediaFiles/Videos/basketball/");

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
                this.postBackStr = Page.ClientScript.GetPostBackEventReference(this, "MyCustomArgument");

                this.ddlMediaTypes.SelectedIndex = 0;
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

            if(!WebsiteAdministration.networkFolder.Equals(String.Empty))
                WebsiteAdministration.filesToProcess = Directory.GetFiles(WebsiteAdministration.networkFolder, "*.*", SearchOption.AllDirectories).Length;
            this.hdnFilesToProcess.Value = WebsiteAdministration.filesToProcess + "";

            gvMedia.DataBind();            
        }

        #endregion


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static int GetFilesToProcess()
        {
             return WebsiteAdministration.filesToProcess;
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static int GetFilesProcessed()
        {
            return WebsiteAdministration.filesProcessed;            
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()] 
        public static string addFilesFromFolder()
        {
            WebsiteAdministration.filesProcessed = 0;

            //Do work
            string directory = WebsiteAdministration.networkFolder;
            string mediaType = WebsiteAdministration.mediaType;

            int[] fileCount = new int[] { 0, 0, 0 };
            WebsiteAdministration.filesToProcess = fileCount[2] = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories).Length;            
            
            string mediaName;
            string genre = "";
            string artist = "";
            string album = "";

            foreach (String filePath in Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories))
            {
                FileInfo file = new FileInfo(filePath);
                mediaName = Path.GetFileNameWithoutExtension(filePath);
                string fileExt = file.Extension;

                if (Directory.GetParent(directory).GetDirectories()[0].Name.Equals("music"))
                {
                    //mediaType = "music";
                    artist = file.Directory.Parent.Name;
                    album = file.Directory.Name;
                }
                else
                {
                    //mediaType = file.Directory.Parent.Name;
                    genre = file.Directory.Name;
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
                            medMediaType = mediaType,
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

                WebsiteAdministration.filesProcessed++;
                //WebsiteAdministration.filesToProcess++;
            }

            return "All finished!";
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()] 
        public static string deleteAllRecordsForType()
        {
            WebsiteAdministration.filesProcessed = 0;

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
                if (sm.medMediaType.Trim().Equals(WebsiteAdministration.mediaType))
                {
                    context.StoredMedias.DeleteOnSubmit(sm);

                    try
                    {
                        context.SubmitChanges();
                        WebsiteAdministration.filesProcessed++;
                        //WebsiteAdministration.filesToProcess++;
                    }
                    catch (Exception ex)
                    {

                    }
                }

            //this.gvMedia.DataBind();

            ////Hide Page Size Controls if no records, else show
            //if (GetGridViewRecordCountByCurrentMediaType() == 0)
            //{
            //    this.lblPageSize.Visible = false;
            //    this.ddlPageSize.Visible = false;
            //    //this.btnDeleteAllRecords.Visible = false;
            //}
            //else
            //{
            //    this.lblPageSize.Visible = true;
            //    this.ddlPageSize.Visible = true;
            //}

            //this.lblFolderMessage.Text = "";

            return "All finished!";
        }


        //public static int[] addFilesFromFolder(string directory, string mediaType)
        //{
        //    int[] fileCount = new int[] { 0, 0, 0 };
        //    fileCount[2] = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories).Length;

        //    string mediaName;
        //    string genre = "";
        //    string artist = "";
        //    string album = "";

        //    foreach (String filePath in Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories))
        //    {
        //        FileInfo file = new FileInfo(filePath);
        //        mediaName = Path.GetFileNameWithoutExtension(filePath);
        //        string fileExt = file.Extension;

        //        if (Directory.GetParent(directory).GetDirectories()[0].Name.Equals("music"))
        //        {
        //            mediaType = "music";
        //            artist = file.Directory.Parent.Name;
        //            album = file.Directory.Name;
        //        }
        //        else
        //        {
        //            mediaType = file.Directory.Parent.Name;
        //            genre = file.Directory.Name;
        //        }

        //        bool recordExists = false;
        //        StorageMediaDataContext context = new StorageMediaDataContext();

        //        foreach (StoredMedia sm in context.StoredMedias)
        //            if (sm.medTitle.Trim().Equals(mediaName))
        //                recordExists = true;

        //        if (!recordExists)
        //        {
        //            try
        //            {
        //                StoredMedia media = new StoredMedia
        //                {
        //                    medTitle = mediaName,
        //                    medLocation = filePath,
        //                    medDateAdded = DateTime.Now,
        //                    medIsViewable = 'Y',
        //                    medArtist = artist,
        //                    medDescription = "",
        //                    medGenre = genre,
        //                    medMediaType = mediaType,
        //                    medDuration = new float(),
        //                    medAlbum = album,
        //                    medFileExt = fileExt,
        //                };

        //                context.StoredMedias.InsertOnSubmit(media);

        //                context.SubmitChanges();

        //                fileCount[0]++;

        //            }
        //            catch (Exception ex)
        //            {
        //            }
        //        }
        //        else
        //            fileCount[1]++;
        //    }

        //    return fileCount;
        //}

        #region Control Event Handlers

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this.lblFolderMessage.ForeColor = Color.Red;
            //this.lblFolderMessage.Text = "";

            // Reset Page Index for Grid
            this.gvMedia.PageIndex = 0;

            this.hdnMediaType.Value = WebsiteAdministration.mediaType = this.ddlMediaTypes.SelectedValue;            

            this.lnqMedia.Where = "medMediaType == \"" + this.ddlMediaTypes.SelectedValue + "\"";  

            switch (this.ddlMediaTypes.SelectedValue)
            {
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
                case "basketball":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.basketballFolder;
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

            WebsiteAdministration.filesToProcess = Directory.GetFiles(WebsiteAdministration.networkFolder, "*.*", SearchOption.AllDirectories).Length;
            this.hdnFilesToProcess.Value = WebsiteAdministration.filesToProcess + "";

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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showBox();", true);
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
            //this.btnApplyChanges.Visible = false;
            //this.btnAddNewMediaRow.Text = "Add new media";
            this.btnAddNewMediaRow.Visible = true;
            this.hdnUpdateMode.Value = "none";

            this.gvMedia.DataBind();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            this.hdnUpdateMode.Value = "edit";

            //this.btnAddNewMediaRow.Text = "Cancel";
            //this.btnApplyChanges.Visible = true;

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


        //protected void btnaddallfromnetworkfolder_click(object sender, eventargs e)
        //{
        //    int duplicates = 0;
        //    int filesadded = 0;
        //    int totalfiles = 0;

        //    int[] filescount = addfilesfromfolder(this.hdnnetworkfolder.value, this.ddlmediatypes.selectedvalue);
        //    filesadded += filescount[0];
        //    duplicates += filescount[1];
        //    totalfiles += filescount[2];

        //    ////movies
        //    //int[] filescount = addfilesfromfolder(moviesfolder, "movie");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    ////tv
        //    //filescount = addfilesfromfolder(tvfolder, "tv");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    ////basketball
        //    //filescount = addfilesfromfolder(basketballfolder, "basketball");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    ////documentary
        //    //filescount = addfilesfromfolder(documentariesfolder, "documentary");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    ////music videos
        //    //filescount = addfilesfromfolder(musicvideosfolder, "musicvideo");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    ////music
        //    //filescount = addfilesfromfolder(musicfolder, "music");
        //    //filesadded += filescount[0];
        //    //duplicates += filescount[1];
        //    //totalfiles += filescount[2];

        //    if (duplicates == totalfiles && totalfiles > 0)
        //    {
        //        this.lblfoldermessage.forecolor = color.red;
        //        this.lblfoldermessage.text = "all " + duplicates + " files were duplicates, no new files were added";
        //    }
        //    else if (duplicates > 0 && duplicates < totalfiles)
        //    {
        //        this.lblfoldermessage.forecolor = color.red;
        //        this.lblfoldermessage.text = "found " + duplicates + " duplicate(s), only " + (totalfiles - duplicates) + " files were added";
        //    }
        //    else if (totalfiles == 0)
        //    {
        //        this.lblfoldermessage.forecolor = color.red;
        //        this.lblfoldermessage.text = "no files were found in the specified directory";
        //    }
        //    else
        //    {
        //        this.lblfoldermessage.forecolor = color.green;
        //        this.lblfoldermessage.text = "all " + totalfiles + " file(s) were added";
        //    }

        //    //hide page size controls if no records, else show
        //    if (convert.toint32(session["totalrowcount"].tostring()) == 0)
        //    {
        //        this.lblpagesize.visible = false;
        //        this.ddlpagesize.visible = false;
        //    }
        //    else
        //    {
        //        this.lblpagesize.visible = true;
        //        this.ddlpagesize.visible = true;
        //    }

        //    this.gvmedia.databind();
        //}

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
    }
}