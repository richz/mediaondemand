using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.ServiceProcess;
using System.Text;
using System.Configuration;
using System.IO;
using MediaOnDemand;
using System.Windows.Forms;
using System.Runtime.InteropServices;
using System.Threading;
using System.Text.RegularExpressions;

namespace MediaFilesWatcher
{
    public partial class Service : ServiceBase
    {
        #region Private Fields

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern IntPtr SendMessage(IntPtr hwnd, uint Msg, IntPtr wParam, IntPtr lParam);

        private const int RF_TESTMESSAGE = 0xA123;

        //Main Folders
        static string rootMediaFilesFolder = ConfigurationManager.AppSettings["WatchPath"];
        static string videosFolder = rootMediaFilesFolder + "videos";
        static string audioFolder = rootMediaFilesFolder + "audio";
        static string picturesFolder = rootMediaFilesFolder + "pictures";

        //Mobile Foders
        static string mobileRootMediaFilesFolder = ConfigurationManager.AppSettings["MobileWatchPath"];
        static string mobileVideosFolder = rootMediaFilesFolder + "video";
        static string mobileAudioFolder = rootMediaFilesFolder + "audio";

        //Subfolders
        static string musicFolder = rootMediaFilesFolder + "audio\\music";
        static string moviesFolder = rootMediaFilesFolder + "videos\\movie";
        static string musicVideosFolder = rootMediaFilesFolder + "videos\\musicvideo";
        static string tvFolder = rootMediaFilesFolder + "videos\\tv";
        static string sportsFolder = rootMediaFilesFolder + "videos\\sports";

        //Directories
        static DirectoryInfo musicDirectory = new DirectoryInfo(musicFolder);
        static DirectoryInfo moviesDirectory = new DirectoryInfo(moviesFolder);
        static DirectoryInfo musicVideosDirectory = new DirectoryInfo(musicVideosFolder);
        static DirectoryInfo tvDirectory = new DirectoryInfo(tvFolder);
        static DirectoryInfo sportsDirectory = new DirectoryInfo(sportsFolder);

        //Mobile Directories
        static DirectoryInfo mobileAudioDirectory = new DirectoryInfo(mobileAudioFolder);
        static DirectoryInfo mobileVideoDirectory = new DirectoryInfo(mobileVideosFolder);

        static List<string> supportedTypes = new List<string> { ".vob", ".avi", ".flv", ".mp4", ".mp3", ".wma", ".wmv", ".mpg", ".mpeg", ".rm", ".mkv", ".divx", ".m4p", ".m4a" };

        public static List<string> supportedMobileVideoTypes = new List<string> { ".mov" };
        public static List<string> supportedMobileAudioTypes = new List<string> { ".mp4", ".mp3" };

        static string rootImagesPath = @"C:\HostedWebSites\MediaOnDemand\images";
        static string videoImagePath = rootImagesPath + @"\posters\";
        static string audioImagePath = rootImagesPath + @"\albumcovers\";

        #endregion

        #region Constructor

        public Service()
        {
            InitializeComponent();
        }
        #endregion

        #region Service Event Handlers

        protected override void OnStart(string[] args)
        {
            if (!EventLog.SourceExists("MediaFilesWatcher"))
                EventLog.CreateEventSource("MediaFilesWatcher", "DoDyLog");

            this.fileSystemWatcher.Path = ConfigurationManager.AppSettings["WatchPath"];
            this.mobileFileSystemWatcher.Path = ConfigurationManager.AppSettings["MobileWatchPath"];

            EventLog.WriteEntry("MediaFilesWatcher", String.Format("MediaFilesWatcher service is starting"));
        }

        protected override void OnStop()
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("MediaFilesWatcher service is stopping"));
        }

        private void fileSystemWatcher_Changed(object sender, System.IO.FileSystemEventArgs e)
        {
        }

        private void fileSystemWatcher_Created(object sender, System.IO.FileSystemEventArgs e)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Adding the file \"{0}\"", e.FullPath));

            bool fileAdded = false;

            AddMediaRecordForCreatedFile(e.FullPath, ref fileAdded);

            if (fileAdded)
            {
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was added", e.FullPath));

                string fileExt = Path.GetExtension(e.FullPath);

                if (fileExt.Equals(".VOB"))
                {
                    EventLog.WriteEntry("MediaFilesWatcher", String.Format("Renaming file \"{0}\" from extension VOB to vob", e.FullPath));

                    try
                    {
                        Thread.Sleep(3000);
                        File.Move(e.FullPath, String.Format("{0}\\{1}.vob", Path.GetDirectoryName(e.FullPath), Path.GetFileNameWithoutExtension(e.FullPath)));
                    }
                    catch (Exception ex)
                    {
                        EventLog.WriteEntry("MediaFilesWatcher", String.Format("The following exception ocurred while attempting to rename the file \"{0}\" to vob format: {1}", e.FullPath, ex.Message));
                    }
                }
            }
            else
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was not added", e.FullPath));
        }

        private void fileSystemWatcher_Deleted(object sender, System.IO.FileSystemEventArgs e)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Deleting file \"{0}\"", e.FullPath));

            bool fileDeleted = false;

            DeleteMediaRecordForDeletedFile(e.FullPath, ref fileDeleted);

            if (fileDeleted)
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was deleted", e.FullPath));
            else
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was not deleted", e.FullPath));
        }

        private void fileSystemWatcher_Renamed(object sender, System.IO.RenamedEventArgs e)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Renaming file \"{0}\"", e.OldFullPath));

            bool fileUpdated = false;

            UpdateMediaRecordForChangedFile(e.OldFullPath, e.FullPath, ref fileUpdated);

            if (fileUpdated)
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was renamed to \"{1}\"", e.OldFullPath, e.FullPath));
            else
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was not renamed", e.OldFullPath));
        }

        #endregion

        #region Helper Methods

        private static void UpdateMediaRecordForChangedFile(string oldPath, string newPath, ref bool fileUpdated)
        {
            string fileExt = Path.GetExtension(oldPath);

            fileUpdated = false;

            if (supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(oldPath).Equals("Thumbs"))
            {
                string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

                StorageMediaDataContext context = new MediaOnDemand.StorageMediaDataContext(connString);

                string mediaType = GetMediaTypeForFile(newPath);

                foreach (StoredMedia sm in context.StoredMedias)
                {
                    if (sm.medTitle.Equals(Path.GetFileNameWithoutExtension(oldPath)))
                    {
                        sm.medTitle = Path.GetFileNameWithoutExtension(newPath);
                        sm.medLocation = newPath.Replace("C:", "\\\\mediaserver");
                        sm.medFileExt = Path.GetExtension(newPath);

                        try
                        {
                            context.SubmitChanges();

                            fileUpdated = true;
                        }
                        catch (Exception ex)
                        {
                        }
                    }
                }
            }
        }

        private static void AddMediaRecordForCreatedFile(string filePath, ref bool fileAdded)
        {
            string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

            StorageMediaDataContext context = new MediaOnDemand.StorageMediaDataContext(connString);

            string fileExt = Path.GetExtension(filePath);

            fileAdded = false;

            if (Service.supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(filePath).Equals("Thumbs"))
            {
                FileInfo file = new FileInfo(filePath);
                string mediaType = GetMediaTypeForFile(filePath);

                string mediaName = Path.GetFileNameWithoutExtension(filePath);
                string genre = "";
                string artist = "";
                string album = "";
                string posterImageUrl = "";
                string mediaT = "";
                int rating = 0;

                string path = filePath.Replace(@"C:", @"\\mediaserver");

                switch (mediaType)
                {
                    case "movie":
                        {
                            mediaT = mediaType;
                            genre = file.Directory.Parent.Name;
                            posterImageUrl = String.Format("../images/posters/{0}.jpg", Service.RemoveSpecialCharacters(mediaName));
                        } break;
                    case "tv":
                        {
                            mediaT = mediaType;
                            album = file.Directory.Parent.Parent.Name;
                            genre = file.Directory.Parent.Name;
                            posterImageUrl = String.Format("../images/posters/{0}.jpg", Service.RemoveSpecialCharacters(album));

                        }
                        break;
                    case "music":
                        {
                            mediaT = mediaType;
                            artist = file.Directory.Parent.Name;
                            album = file.Directory.Name;
                            posterImageUrl = String.Format("../images/albumcovers/music.jpg", Service.RemoveSpecialCharacters(album));
                        }
                        break;
                    case "sports":
                        {
                            mediaT = mediaType;
                            genre = file.Directory.Parent.Parent.Name; //Sport
                            album = file.Directory.Parent.Name;
                            posterImageUrl = String.Format("../images/posters/{0}.jpg", Service.RemoveSpecialCharacters(album));
                        }
                        break;
                    case "musicvideo":
                        {
                            mediaT = mediaType;
                            artist = file.Directory.Parent.Parent.Name;
                            album = genre = file.Directory.Parent.Name;
                            posterImageUrl = String.Format("../images/albumcovers/{0}.jpg", Service.RemoveSpecialCharacters(album));
                        }
                        break;
                }

                bool recordExists = false;

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
                            medLocation = path,
                            medDateAdded = DateTime.Now,
                            medIsViewable = 'Y',
                            medArtist = artist,
                            medDescription = "",
                            medGenre = genre,
                            medMediaType = mediaT,
                            medDuration = new float(),
                            medAlbum = album,
                            medPosterImageUrl = posterImageUrl,
                            medFileExt = fileExt,
                            medRating = rating
                        };

                        context.StoredMedias.InsertOnSubmit(media);

                        context.SubmitChanges();

                        foreach (StoredMedia sm in context.StoredMedias)
                            if (sm.medTitle.Trim().Equals(mediaName))
                                recordExists = true;

                        if (recordExists)
                        {
                            fileAdded = true;
                        }
                        else
                            fileAdded = false;
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        private static void DeleteMediaRecordForDeletedFile(string filePath, ref bool fileDeleted)
        {
            string fileExt = Path.GetExtension(filePath);

            fileDeleted = false;

            if (supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(filePath).Equals("Thumbs"))
            {
                string path = filePath.Replace(@"C:", @"\\mediaserver");

                string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

                StorageMediaDataContext context = new MediaOnDemand.StorageMediaDataContext(connString);

                foreach (StoredMedia sm in context.StoredMedias)
                {
                    if (sm.medLocation.Trim().Equals(path))
                    {
                        context.StoredMedias.DeleteOnSubmit(sm);
                    }
                }

                try
                {
                    context.SubmitChanges();
                    bool recordExists = false;

                    foreach (StoredMedia sm in context.StoredMedias)
                        if (sm.medLocation.Trim().Equals(filePath))
                            recordExists = true;

                    if (!recordExists)
                    {
                        fileDeleted = true;
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        private static void AddMobileMediaRecordForCreatedFile(string filePath, ref bool fileAdded)
        {
            string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

            MobileMediaDataContext context = new MediaOnDemand.MobileMediaDataContext(connString);

            string fileExt = Path.GetExtension(filePath);

            if ((Service.supportedMobileAudioTypes.Contains(fileExt.ToLower()) || Service.supportedMobileVideoTypes.Contains(fileExt.ToLower())) && !Path.GetFileNameWithoutExtension(filePath).Equals("Thumbs"))
            {
                FileInfo file = new FileInfo(filePath);

                string mediaTitle = Path.GetFileNameWithoutExtension(filePath);
                string posterImageUrl = "";
                string mediaT = "";
                int rating = 0;

                string path = filePath.Replace(@"E:", @"\\mediaserver");

                if (Service.supportedMobileAudioTypes.Contains(fileExt.ToLower()))
                {
                    mediaT = "audio";

                    if (File.Exists(audioImagePath + mediaTitle + ".jpg"))
                        posterImageUrl = String.Format("../../images/albumcovers/{0}.jpg", mediaTitle);
                    else
                        posterImageUrl = String.Format("../../images/albumcovers/audio.jpg");
                }
                else if (Service.supportedMobileVideoTypes.Contains(fileExt.ToLower()))
                {
                    mediaT = "video";

                    if (File.Exists(videoImagePath + mediaTitle + ".jpg"))
                        posterImageUrl = String.Format("../../images/posters/{0}.jpg", mediaTitle);
                    else
                        posterImageUrl = String.Format("../../images/posters/video.jpg");
                }
                
                bool recordExists = false;

                foreach (MobileMedia sm in context.MobileMedias)
                    if (sm.mobMediaTitle.Trim().Equals(mediaTitle))
                        recordExists = true;

                if (!recordExists)
                {
                    try
                    {
                        MobileMedia media = new MobileMedia
                        {
                            mobMediaTitle = mediaTitle,
                            mobFileName = mediaTitle + Path.GetExtension(filePath),
                            mobDateAdded = DateTime.Now,
                            mobIsViewable = 'Y',
                            mobMediaFileExt = Path.GetExtension(filePath),
                            mobMediaType = mediaT,
                            mobRating = rating,
                            mobPosterImageUrl = posterImageUrl
                        };

                        context.MobileMedias.InsertOnSubmit(media);

                        context.SubmitChanges();

                        foreach (MobileMedia sm in context.MobileMedias)
                            if (sm.mobMediaTitle.Trim().Equals(mediaTitle))
                                recordExists = true;

                        if (recordExists)
                        {
                            fileAdded = true;
                        }
                        else
                            fileAdded = false;
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        private static void DeleteMobileMediaRecordForDeletedFile(string filePath, ref bool fileDeleted)
        {
            string fileExt = Path.GetExtension(filePath);

            fileDeleted = false;

            if ((Service.supportedMobileAudioTypes.Contains(fileExt.ToLower()) || Service.supportedMobileVideoTypes.Contains(fileExt.ToLower())) && !Path.GetFileNameWithoutExtension(filePath).Equals("Thumbs"))
            {
                string mediaTitle = Path.GetFileNameWithoutExtension(filePath);
                string mediaType = "audio";

                if (Service.supportedMobileAudioTypes.Contains(fileExt.ToLower()))
                    mediaType = "audio";
                else if (Service.supportedMobileVideoTypes.Contains(fileExt.ToLower()))
                    mediaType = "video";

                string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

                MobileMediaDataContext context = new MediaOnDemand.MobileMediaDataContext(connString);

                int count = 0;

                foreach (MobileMedia sm in context.MobileMedias)
                {
                    if (sm.mobMediaType.Trim().Equals(mediaType) && sm.mobMediaTitle.Trim().Equals(mediaTitle))
                    {
                        context.MobileMedias.DeleteOnSubmit(sm);
                    }

                    count++;
                }

                try
                {
                    context.SubmitChanges();

                    bool recordDoesNotExist = false;
                    foreach (MobileMedia sm in context.MobileMedias)
                    {
                        if (sm.mobMediaType.Trim().Equals(mediaType) && sm.mobMediaTitle.Trim().Equals(mediaTitle))
                        {
                            recordDoesNotExist = true;
                        }
                    }

                    if (recordDoesNotExist)
                    {
                        fileDeleted = true;
                    }
                }
                catch (Exception ex)
                {
                }
            }
        }

        public static string RemoveSpecialCharacters(string input)
        {
            Regex r = new Regex("(?:[^a-z0-9 ]|(?<=['\"]))", RegexOptions.IgnoreCase | RegexOptions.CultureInvariant | RegexOptions.Compiled);
            return r.Replace(input, String.Empty);
        }

        public static string GetMediaTypeForFile(string filePath)
        {
            FileInfo file = new FileInfo(filePath);

            string mediaT = "";
            FileInfo[] files;

            if (musicDirectory.Exists)
            {
                files = musicDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "music";
            }

            if (moviesDirectory.Exists)
            {
                files = moviesDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "movie";
            }

            if (tvDirectory.Exists)
            {
                files = tvDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "tv";
            }

            if (musicVideosDirectory.Exists)
            {
                files = musicVideosDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "musicvideo";
            }

            if (sportsDirectory.Exists)
            {
                files = sportsDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "sports";
            }

            return mediaT;
        }

        public static string GetMediaTypeForMobileFile(string filePath)
        {
            FileInfo file = new FileInfo(filePath);

            string mediaT = "";
            FileInfo[] files;

            if (mobileAudioDirectory.Exists)
            {
                files = musicDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "audio";
            }

            if (mobileVideoDirectory.Exists)
            {
                files = moviesDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "video";
            }

            return mediaT;
        }

        #endregion

        private void mobileFileSystemWatcher_Changed(object sender, FileSystemEventArgs e)
        {

        }

        private void mobileFileSystemWatcher_Created(object sender, FileSystemEventArgs e)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Adding the file \"{0}\"", e.FullPath));

            bool fileAdded = false;

            AddMobileMediaRecordForCreatedFile(e.FullPath, ref fileAdded);

            if (fileAdded)
            {
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was added", e.FullPath));

                string fileExt = Path.GetExtension(e.FullPath);
            }
            else
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was not added", e.FullPath));
        }

        private void mobileFileSystemWatcher_Deleted(object sender, FileSystemEventArgs e)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Deleting file \"{0}\"", e.FullPath));

            bool fileDeleted = false;

            DeleteMobileMediaRecordForDeletedFile(e.FullPath, ref fileDeleted);

            if (fileDeleted)
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was deleted", e.FullPath));
            else
                EventLog.WriteEntry("MediaFilesWatcher", String.Format("File \"{0}\" was not deleted", e.FullPath));
        }

        private void mobileFileSystemWatcher_Renamed(object sender, RenamedEventArgs e)
        {

        }
    }
}
