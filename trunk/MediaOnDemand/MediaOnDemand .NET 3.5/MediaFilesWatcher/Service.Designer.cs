﻿namespace MediaFilesWatcher
{
    partial class Service
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.fileSystemWatcher = new System.IO.FileSystemWatcher();
            this.eventLog = new System.Diagnostics.EventLog();
            this.mobileFileSystemWatcher = new System.IO.FileSystemWatcher();
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.eventLog)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.mobileFileSystemWatcher)).BeginInit();
            // 
            // fileSystemWatcher
            // 
            this.fileSystemWatcher.EnableRaisingEvents = true;
            this.fileSystemWatcher.IncludeSubdirectories = true;
            this.fileSystemWatcher.NotifyFilter = ((System.IO.NotifyFilters)((((((System.IO.NotifyFilters.FileName | System.IO.NotifyFilters.DirectoryName)
                        | System.IO.NotifyFilters.LastWrite)
                        | System.IO.NotifyFilters.LastAccess)
                        | System.IO.NotifyFilters.CreationTime)
                        | System.IO.NotifyFilters.Security)));
            this.fileSystemWatcher.Changed += new System.IO.FileSystemEventHandler(this.fileSystemWatcher_Changed);
            this.fileSystemWatcher.Created += new System.IO.FileSystemEventHandler(this.fileSystemWatcher_Created);
            this.fileSystemWatcher.Deleted += new System.IO.FileSystemEventHandler(this.fileSystemWatcher_Deleted);
            this.fileSystemWatcher.Renamed += new System.IO.RenamedEventHandler(this.fileSystemWatcher_Renamed);
            // 
            // eventLog
            // 
            this.eventLog.EnableRaisingEvents = true;
            this.eventLog.Log = "Application";
            this.eventLog.Source = "MediaFilesWatcher";
            // 
            // mobileFileSystemWatcher
            // 
            this.mobileFileSystemWatcher.EnableRaisingEvents = true;
            this.mobileFileSystemWatcher.IncludeSubdirectories = true;
            this.mobileFileSystemWatcher.NotifyFilter = ((System.IO.NotifyFilters)((((((System.IO.NotifyFilters.FileName | System.IO.NotifyFilters.DirectoryName)
                        | System.IO.NotifyFilters.LastWrite)
                        | System.IO.NotifyFilters.LastAccess)
                        | System.IO.NotifyFilters.CreationTime)
                        | System.IO.NotifyFilters.Security)));
            this.mobileFileSystemWatcher.Changed += new System.IO.FileSystemEventHandler(this.mobileFileSystemWatcher_Changed);
            this.mobileFileSystemWatcher.Created += new System.IO.FileSystemEventHandler(this.mobileFileSystemWatcher_Created);
            this.mobileFileSystemWatcher.Deleted += new System.IO.FileSystemEventHandler(this.mobileFileSystemWatcher_Deleted);
            this.mobileFileSystemWatcher.Renamed += new System.IO.RenamedEventHandler(this.mobileFileSystemWatcher_Renamed);
            // 
            // Service
            // 
            this.ServiceName = "MediaFiles File Watcher";
            ((System.ComponentModel.ISupportInitialize)(this.fileSystemWatcher)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.eventLog)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.mobileFileSystemWatcher)).EndInit();

        }

        #endregion

        private System.IO.FileSystemWatcher fileSystemWatcher;
        private System.Diagnostics.EventLog eventLog;
        private System.IO.FileSystemWatcher mobileFileSystemWatcher;
    }
}
