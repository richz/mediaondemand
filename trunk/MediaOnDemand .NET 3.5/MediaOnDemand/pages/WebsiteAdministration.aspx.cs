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
using System.Windows.Forms;
using System.Threading;

namespace MediaOnDemand
{
    public partial class WebsiteAdministration : System.Web.UI.Page
    {
        #region Private Fields

        //Main Folders
        static string rootMediaFilesFolder = "\\\\mediaserver\\mediafiles";
        static string videosFolder = rootMediaFilesFolder + "\\videos";
        static string audioFolder = rootMediaFilesFolder + "\\audio";
        static string picturesFolder = rootMediaFilesFolder + "\\pictures";

        //Subfolders
        static string musicFolder = rootMediaFilesFolder + "\\audio\\music";
        static string moviesFolder = rootMediaFilesFolder + "\\videos\\movie";
        static string musicVideosFolder = rootMediaFilesFolder + "\\videos\\musicvideo";
        static string tvFolder = rootMediaFilesFolder + "\\videos\\tv";
        static string sportsFolder = rootMediaFilesFolder + "\\videos\\sports";
        static DirectoryInfo musicDirectory = new DirectoryInfo(musicFolder);
        static DirectoryInfo moviesDirectory = new DirectoryInfo(moviesFolder);
        static DirectoryInfo musicVideosDirectory = new DirectoryInfo(musicVideosFolder);
        static DirectoryInfo tvDirectory = new DirectoryInfo(tvFolder);
        static DirectoryInfo sportsDirectory = new DirectoryInfo(sportsFolder);

        //Supported file types
        public static List<string> supportedTypes = new List<string> { ".vob", ".avi", ".flv", ".mp4", ".mp3", ".wma", ".wmv", ".mpg", ".mpeg", ".rm", ".mkv", ".divx", ".m4p", ".m4a" };

        //Set values
        static string networkFolder = "";
        static string mediaType = "";
        static int filesToProcess = 0;
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

                this.ddlMediaTypes.SelectedIndex = 0;
                this.hdnMediaType.Value = ddlMediaTypes.SelectedValue;

                this.hdnUpdateMode.Value = "none";


                this.btnAddNewMediaRow.Enabled = true;

                //default
                this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.moviesFolder;
                this.hdnMediaType.Value = WebsiteAdministration.mediaType = "movie";

                this.gvMedia.PageSize = Convert.ToInt32(this.ddlPageSize.Items[0].Value);
                this.gvMedia.Sort("medTitle", SortDirection.Ascending);

                this.btnDeleteAllRecords.Visible = true;
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
            //Do work
            string directory = WebsiteAdministration.networkFolder;
            string mediaType = WebsiteAdministration.mediaType;

            int[] fileCount = new int[] { 0, 0, 0 };
            
            string mediaName;
            string genre = "";
            string artist = "";
            string album = "";
            string mediaT = "";

            string[] files = new string[0];

            try
            {
                files = Directory.GetFiles(directory, "*.*", SearchOption.AllDirectories);
            }
            catch (Exception e)
            {
                return "";
            }

            filesToProcess = files.Count();

            foreach (String filePath in files)
            {
                filesProcessed = fileCount[0];

                FileInfo file = new FileInfo(filePath);

                mediaName = Path.GetFileNameWithoutExtension(filePath);
                string fileExt = file.Extension;

                if (WebsiteAdministration.supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(filePath).Equals("Thumbs"))
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
                                album = file.Directory.Parent.Name;
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
                        {
                            recordExists = true;
                            break;
                        }

                    if (!recordExists)
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
                            medPosterImageUrl = String.Format("../images/posters/{0}.jpg", mediaName),
                            medFileExt = fileExt
                        };

                        context.StoredMedias.InsertOnSubmit(media);

                        try
                        {
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
            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medMediaType.Trim().Equals(WebsiteAdministration.mediaType))
                {
                    context.StoredMedias.DeleteOnSubmit(sm);
                }
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

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string deleteAllMediaRecords()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            context.StoredMedias.DeleteAllOnSubmit(context.StoredMedias);

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

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string syncAllMediaRecords()
        {
            deleteAllMediaRecords();
            string directory = WebsiteAdministration.networkFolder;
            WebsiteAdministration.networkFolder = rootMediaFilesFolder;
            addFilesFromFolder();
            WebsiteAdministration.networkFolder = directory;

            return "All finished!";
        }

        #region Control Event Handlers

        protected void ddlMediaTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
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
                    }
                    break;
                case "movie":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.moviesFolder;
                    }
                    break;
                case "tv":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.tvFolder;
                    }
                    break;
                case "sports":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.sportsFolder;
                    }
                    break;
                case "musicvideo":
                    {
                        this.hdnNetworkFolder.Value = WebsiteAdministration.networkFolder = WebsiteAdministration.musicVideosFolder;
                    }
                    break;
            }

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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showEditLightBox();", true);
            }
            else
            {
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
                    this.addNewMediaRecord(this.hdnTitle.Value, this.hdnLocation.Value, Convert.ToChar(this.hdnIsViewable.Value), this.hdnArtist.Value, this.hdnDescription.Value, this.hdnGenre.Value, this.hdnMediaType.Value, duration, this.hdnAlbum.Value, this.hdnPosterImageUrl.Value, fileExt);
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
                string posterImageUrl = this.hdnPosterImageUrl.Value.Trim();
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
                row.medPosterImageUrl = posterImageUrl;

                try
                {
                    context.SubmitChanges();
                }
                catch (Exception ex)
                {
                }
            }
            this.btnAddNewMediaRow.Visible = true;
            this.hdnUpdateMode.Value = "none";

            this.gvMedia.DataBind();
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            this.hdnUpdateMode.Value = "edit";

            this.hdnMedId.Value = (sender as LinkButton).CommandArgument;

            this.RetrieveRowDataToEdit(this.hdnMedId.Value);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Show lightbox", "showEditLightBox();", true);
        }

        private void addNewMediaRecord(string mediaName, string filePath, char isViewable, string artist, string description, string genre, string mediaType, float duration, string album, string posterMediaUrl, string fileExt)
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
                medPosterImageUrl = posterMediaUrl,
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
            }
            else
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }

        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
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

        private void RetrieveRowDataToEdit(string mediaId)
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
                    this.hdnDescription.Value = sm.medDescription != null ? sm.medDescription.Trim() : "";
                    this.hdnGenre.Value = sm.medGenre.Trim();
                    this.hdnMediaType.Value = sm.medMediaType.Trim();
                    this.hdnDuration.Value = sm.medDuration.ToString().Trim();
                    this.hdnAlbum.Value = sm.medAlbum.Trim();
                    this.hdnPosterImageUrl.Value = sm.medPosterImageUrl != null ? sm.medPosterImageUrl.Trim() : ""; ;
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

        protected void lnqMedia_Selected(object sender, LinqDataSourceStatusEventArgs e)
        {
            Session["TotalRowCount"] = e.TotalRowCount;
            UpdateRecordCount();

            if (e.TotalRowCount > 0)
            {
                this.lblPageSize.Visible = true;
                this.ddlPageSize.Visible = true;
            }
            else
            {
                this.lblPageSize.Visible = false;
                this.ddlPageSize.Visible = false;
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