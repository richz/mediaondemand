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
    public partial class WatchMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblFileMessages.Text = "";
        }

        protected void lnkMovieLink_Click(object sender, EventArgs e)
        {
            LinkButton movieLink = (sender as LinkButton);

            string location = movieLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                Process vlc = new Process();
                string vlcPath = "C:\\Program Files (x86)\\VideoLAN\\VLC\\vlc.exe";

                vlc.StartInfo.FileName = vlcPath;
                vlc.StartInfo.Arguments = "\"" + location + "\"";
                vlc.Start();
            }
            else
                this.lblFileMessages.Text = "File could not be found";
        }
    }
}