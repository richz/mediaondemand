using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.IO;

namespace MediaOnDemand
{
    public partial class StreamMusic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblFileMessages.Text = "";
        }

        protected void SongLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton songLink = (sender as LinkButton);

            string location = songLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                string windowsMediaPlayerPath = "C:\\Program Files (x86)\\Windows Media Player\\wmplayer.exe";
                Process windowsMP = new Process();
                windowsMP.StartInfo.FileName = windowsMediaPlayerPath;
                windowsMP.StartInfo.Arguments = location;
                windowsMP.Start();
            }
            else
                this.lblFileMessages.Text = "File could not be found";
        }

    }
}