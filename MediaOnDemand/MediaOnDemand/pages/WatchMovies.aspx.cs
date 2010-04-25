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
            this.lblMessage.Text = "";

            if (!IsPostBack)
            {
                this.wmPlayer.MovieURL = "";
                this.wmPlayer.AutoStart = true;
                this.gvMovies.PageSize = 20;                
            }

            this.lblFileMessages.Text = "";            
        }

        protected void lnkMovieLink_Click(object sender, EventArgs e)
        {
            this.wmPlayer.MovieURL = "";

            LinkButton movieLink = (sender as LinkButton);

            string location = movieLink.CommandArgument;

            if ((new FileInfo(location)).Exists)
            {
                this.wmPlayer.MovieURL = location;
                this.lblMessage.Text = "Please click othe Play button if the movie does not start";

               // ScriptManager.RegisterStartupScript(this, this.GetType(), "Open Player Window", "window.open ('Player.aspx?file=" + location + "','MediaPlayer')", true);
            }
            else
                this.lblFileMessages.Text = "File could not be found";
            
        }
    }
}