using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected string moviesMenu = "";
        protected string musicMenu = "";
        protected string tvMenu = "";
        protected string musicVideosMenu = "";
        protected string sportsMenu = "";
        
        private List<string> menuList;

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        
        private void Page_PreRender(object sender, System.EventArgs e)
        {
            // Data driven menu, dynamically build menu from storedmedia table values
            BuildMenu();
        }

        private void BuildMenu()
        {
            SetupMenu("Movies", "movie", "Genre");
            SetupMenu("Music", "music", "Artist");
            SetupMenu("Music Videos", "musicvideo", "Artist");
            SetupMenu("Television", "tv", "Series");
            SetupMenu("Sports", "sports", "Sport");            
        }
        
        private void SetupMenu(string mediaTypeLabel, string mediaType, string mediaFilter)
        {
            StringBuilder sb = new StringBuilder();

            switch(mediaType)
            {
                case "movie":                
                case "sports":
                    menuList = GetMediaGenres(mediaType);
                    break;
                case "music":                    
                case "musicvideo":
                    menuList = GetMediaArtists(mediaType);
                    break;
                case "tv":
                    menuList = GetTvSeries();
                    break;
            }

            for (int i = 0; i < menuList.Count; i++)
            {
                if(i == 0)
                {
                    sb.AppendFormat("<li class=\"dropdown\"><a class=\"dropdown-toggle\" data-toggle=\"dropdown\">{0}<b class=\"caret\"></b></a>" +
                                   "<ul class=\"dropdown-menu scroll-menu\">", mediaTypeLabel, mediaType);
                }

                SetupMenuItem(mediaType, mediaFilter, menuList[i], menuList[i], i == 0 || i == menuList.Count - 1, ref sb);

                if (i == menuList.Count - 1)
                    sb.Append("</ul></li>");
            }            
            
            switch(mediaType)
            {
                case "movie":                    
                    moviesMenu = sb.ToString();                    
                    break;
                case "music":
                    musicMenu = sb.ToString();
                    break;
                case "tv":
                    tvMenu = sb.ToString();
                    break;
                case "musicvideo":
                    musicVideosMenu = sb.ToString();
                    break;
                case "sports":
                    sportsMenu = sb.ToString();
                    break;
            }
        }

        private void SetupMenuItem(string mediaType, string mediaFilter, string value, string label, bool firstOrLastItem, ref StringBuilder sb)
        {
            if (!firstOrLastItem)
                sb.Append("<li class=\"divider\"></li>");

            sb.Append(string.Format("<li><a href=\"Media.aspx?Type={0}&{1}={2}\">{3}</a></li>", mediaType, mediaFilter, value, label));
        }

        private List<string> GetMediaGenres(string mediaType)
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var genres = from sm in context.StoredMedias
                         where sm.medMediaType.Equals(mediaType)
                         select sm.medGenre;

            return genres.Distinct().ToList<string>();
        }

        private List<string> GetMediaArtists(string mediaType)
        {         
            StorageMediaDataContext context = new StorageMediaDataContext();

            var artists = from sm in context.StoredMedias
                         where sm.medMediaType.Equals(mediaType)
                         select sm.medArtist;

            return artists.Distinct().ToList<string>();
        }

        private List<string> GetTvSeries()
        {
            StorageMediaDataContext context = new StorageMediaDataContext();

            var series = from sm in context.StoredMedias
                          where sm.medMediaType.Equals("tv")
                          select sm.medAlbum;

            return series.Distinct().ToList<string>();
        }
    }
}