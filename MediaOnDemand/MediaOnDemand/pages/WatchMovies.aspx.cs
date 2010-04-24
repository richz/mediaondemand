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
                this.hdnFilePath.Value = location;
                
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Launch VLC", "runcmd();", true);

                

                //Process vlc = new Process();
                //string vlcPath = "C:\\Program Files (x86)\\VideoLAN\\VLC\\vlc.exe";

                //vlc.StartInfo.FileName = vlcPath;
                //vlc.StartInfo.Arguments = "\"" + location + "\"";
                //vlc.StartInfo.UserName = "GAMER";

                //System.Security.SecureString pwd = new System.Security.SecureString();

                //foreach (char c in "Supersaiyan4")
                //    pwd.AppendChar(c);

                //vlc.StartInfo.Password = pwd;
                //vlc.StartInfo.CreateNoWindow = false;
                //vlc.StartInfo.Verb = "open";
                //vlc.StartInfo.UseShellExecute = false;

                //try
                //{
                //    vlc.Start();
                //}
                //catch(InvalidOperationException ex)
                //{
                //}
            }
            else
                this.lblFileMessages.Text = "File could not be found";


        }
    }
}