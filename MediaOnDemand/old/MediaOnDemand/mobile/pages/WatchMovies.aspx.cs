using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand.mobile.pages
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        protected void imgPosterImage_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgPosterImage = sender as ImageButton;                        
            string mediaTitle = imgPosterImage.CommandArgument;

            playMedia(mediaTitle);
        }

        private void playMedia(string mediaTitle)
        {
            string queryString = "?";

            queryString += "mediaType=video";

            queryString += "&";

            queryString += "mediaTitle=" + mediaTitle;

            Response.Redirect("Play.aspx" + queryString);
        }
        
        
    }
}