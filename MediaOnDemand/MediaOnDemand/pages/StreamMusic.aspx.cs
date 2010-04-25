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
            this.wmPlayer.MovieURL = "";
        }

        protected void SongLinkButton_Click(object sender, EventArgs e)
        {
            this.wmPlayer.MovieURL = "";

            LinkButton songLink = (sender as LinkButton);

            string location = songLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                this.wmPlayer.MovieURL = location;
            }
            else
                this.lblFileMessages.Text = "File could not be found";
        }

    }
}