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

namespace MediaFilesWatcher
{
    public partial class Service : ServiceBase
    {

        [DllImport("user32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        private static extern IntPtr SendMessage(IntPtr hwnd, uint Msg, IntPtr wParam, IntPtr lParam);

        private const int RF_TESTMESSAGE = 0xA123;

        //Main Folders
        static string rootMediaFilesFolder = ConfigurationManager.AppSettings["WatchPath"];
        static string videosFolder = rootMediaFilesFolder + "videos";
        static string audioFolder = rootMediaFilesFolder + "audio";
        static string picturesFolder = rootMediaFilesFolder + "pictures";

        //Subfolders
        static string musicFolder = rootMediaFilesFolder + "audio\\music";
        static string moviesFolder = rootMediaFilesFolder + "videos\\movie";
        static string musicVideosFolder = rootMediaFilesFolder + "videos\\musicvideo";
        static string tvFolder = rootMediaFilesFolder + "videos\\tv";
        static string sportsFolder = rootMediaFilesFolder + "videos\\sports";
        static DirectoryInfo musicDirectory = new DirectoryInfo(musicFolder);
        static DirectoryInfo moviesDirectory = new DirectoryInfo(moviesFolder);
        static DirectoryInfo musicVideosDirectory = new DirectoryInfo(musicVideosFolder);
        static DirectoryInfo tvDirectory = new DirectoryInfo(tvFolder);
        static DirectoryInfo sportsDirectory = new DirectoryInfo(sportsFolder);

        static List<string> supportedTypes = new List<string> { ".vob", ".avi", ".flv", ".mp4", ".mp3", ".mpg", ".mpeg", ".rm", ".mkv", ".divx", ".m4p", ".m4a" };

        static NotifyIcon appIcon;

        public Service()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            if (!EventLog.SourceExists("MediaFilesWatcher"))
                EventLog.CreateEventSource("MediaFilesWatcher", "DoDyLog");

            this.fileSystemWatcher.Path = ConfigurationManager.AppSettings["WatchPath"];
        }

        protected override void OnStop()
        {
        }

        private void fileSystemWatcher_Changed(object sender, System.IO.FileSystemEventArgs e)
        {
        }

        private void fileSystemWatcher_Created(object sender, System.IO.FileSystemEventArgs e)
        {
            string fileExt = Path.GetExtension(e.FullPath);
            FileInfo file = new FileInfo(e.FullPath);
            if (supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(e.FullPath).Equals("Thumbs"))
            {
                AddMediaRecordForCreatedFile(e.FullPath);

                if (fileExt.Equals(".VOB"))
                {                    
                    try
                    {
                        Thread.Sleep(3000);
                        File.Move(e.FullPath, String.Format("{0}\\{1}.vob", Path.GetDirectoryName(e.FullPath), Path.GetFileNameWithoutExtension(e.FullPath)));
                    }
                    catch (Exception ex)
                    {
                        eventLog.WriteEntry(ex.Message);
                    }

                }
            }
        }

        private void fileSystemWatcher_Deleted(object sender, System.IO.FileSystemEventArgs e)
        {
            string fileExt = Path.GetExtension(e.FullPath);
            if (supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(e.FullPath).Equals("Thumbs"))
            {
                DeleteMediaRecordForDeletedFile(e.FullPath);
            }
        }

        private void fileSystemWatcher_Renamed(object sender, System.IO.RenamedEventArgs e)
        {
            string fileExt = Path.GetExtension(e.FullPath);
            if (supportedTypes.Contains(fileExt.ToLower()) && !Path.GetFileNameWithoutExtension(e.FullPath).Equals("Thumbs"))
            {
                UpdateMediaRecordForChangedFile(e.OldFullPath, e.FullPath);
            }
        }

        private static void UpdateMediaRecordForChangedFile(string oldPath, string newPath)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Updating file \"{0}\"", oldPath));

            string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

            StorageMediaDataContext context = new MediaOnDemand.StorageMediaDataContext(connString);

            string mediaType = GetMediaTypeForFile(newPath);

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medLocation.Equals(oldPath))
                {
                    sm.medTitle = Path.GetFileNameWithoutExtension(newPath);
                    sm.medLocation = newPath;
                    sm.medFileExt = Path.GetExtension(newPath);

                    try
                    {
                        context.SubmitChanges();

                        //ShowToolTip(String.Format("File {0} was renamed to {1}", oldPath, newPath));
                        ShowToolTip(2);

                    }
                    catch (Exception ex)
                    {
                        EventLog.WriteEntry("MediaFilesWatcher", String.Format("Error ocurred submitting DB changes\n\"{0}\"", ex.Message));
                    }
                }
            }
        }

        private static void AddMediaRecordForCreatedFile(string filePath)
        {
            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Adding file \"{0}\"", filePath));

            string connString = ConfigurationManager.ConnectionStrings["MediaFileWatcherWinServiceConnectionString"].ConnectionString;

            StorageMediaDataContext context = new MediaOnDemand.StorageMediaDataContext(connString);

            bool fileAdded = false;

            string fileExt = Path.GetExtension(filePath);
            FileInfo file = new FileInfo(filePath);
            string mediaType = GetMediaTypeForFile(filePath);

            string mediaName = Path.GetFileNameWithoutExtension(filePath);
            string genre = "";
            string artist = "";
            string album = "";
            string mediaT = mediaType;

            switch (mediaType)
            {
                case "movie":
                    {
                        genre = file.Directory.Parent.Name;

                    } break;
                case "tv":
                    {
                        genre = file.Directory.Parent.Parent.Name;
                        album = file.Directory.Parent.Name;
                        break;
                    }
                case "music":
                    {
                        artist = file.Directory.Parent.Name;
                        album = file.Directory.Name;
                    }
                    break;
                case "sports":
                    {
                        genre = file.Directory.Parent.Parent.Name;
                    }
                    break;
                case "musicvideo":
                    {
                        genre = file.Directory.Parent.Name;
                        album = file.Directory.Name;
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

                    context.SubmitChanges();

                    fileAdded = true;

                    //ShowToolTip(String.Format("File {0} was added to {1}", Path.GetFileName(path), Path.GetDirectoryName(path)));
                    ShowToolTip(1);
                }
                catch (Exception ex)
                {
                    EventLog.WriteEntry("MediaFilesWatcher", String.Format("Error ocurred submitting DB changes\n\"{0}\"", ex.Message));
                }
            }

        }

        private static void DeleteMediaRecordForDeletedFile(string path)
        {

            EventLog.WriteEntry("MediaFilesWatcher", String.Format("Deleting file \"{0}\"", path));

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

                //ShowToolTip(String.Format("File {0} was deleted from {1}", Path.GetFileName(path), Path.GetDirectoryName(path)));
                ShowToolTip(3);
            }
            catch (Exception ex)
            {

                EventLog.WriteEntry("MediaFilesWatcher", String.Format("Error ocurred submitting DB changes\n\"{0}\"", ex.Message));
            }
        }

        public static void ShowToolTip(uint Message)
        {
            ////get this running process
            //Process proc = Process.GetCurrentProcess();
            ////get all other (possible) running instances
            //Process[] processes = Process.GetProcessesByName(Properties.Settings.Default.ClientProcessName);

            //if (processes.Length > 1)
            //{
            //    //iterate through all running target applications
            //    foreach (Process p in processes)
            //    {
            //        if (p.Id != proc.Id)
            //        {
            //            //now send the RF_TESTMESSAGE to the running instance
            //            SendMessage(p.MainWindowHandle, Message, IntPtr.Zero, IntPtr.Zero);
            //        }
            //    }
            //}
            //else
            //{
            //    //MessageBox.Show("No other running applications found.");
            //}
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
                    mediaT = "musicvideos";
            }

            if (sportsDirectory.Exists)
            {
                files = sportsDirectory.GetFiles(file.Name, SearchOption.AllDirectories);
                if (files.Length > 0)
                    mediaT = "sports";
            }

            return mediaT;
        }
    }
}
