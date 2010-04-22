using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.IO;


namespace MediaOnDemand
{
    public class HelperClasses
    {
        public static Control GetControlById(Control parent, String childId)
        {
            Control result = parent.FindControl(childId);
            if (result != null) return result;
            if (parent.Controls.Count > 0)
                foreach (Control control in parent.Controls)
                {
                    result = GetControlById(control, childId);
                    if (result != null) return result;
                    else continue;
                }
            return null;
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
    //       //System.Windows.Forms.MessageBox.Show("A new file has been created!");
    //    }

    //    public override string ToString()
    //    {
    //        return this.folder;
    //    }
    //}
}
