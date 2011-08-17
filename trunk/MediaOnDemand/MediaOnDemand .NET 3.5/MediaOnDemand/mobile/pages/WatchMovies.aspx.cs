using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MediaOnDemand.mobile.pages
{
    public partial class WatchMovies : System.Web.UI.Page
    {
        static string rootMobileMediaFolder = @"\\MEDIASERVER\MediaFiles\mobile\";
        static string musicFolder = rootMobileMediaFolder + @"\audio";
        static string moviesFolder = rootMobileMediaFolder + @"\video";

        public static List<string> supportedAudioTypes = new List<string> { ".mp4", ".mp3" };
        public static List<string> supportedVideoTypes = new List<string> { ".mov" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["mediaType"] = this.ddlMediaType.Items[0].Value;                
            }

            if (!Request.UserAgent.Contains("iPhone"))
                this.btnAddAllMedia.Visible = true;
        }

        protected void lnkMusic_Click(object sender, EventArgs e)
        {
            LinkButton lnkMusic = sender as LinkButton;
            string mediaTitle = lnkMusic.CommandArgument;

            playMedia(mediaTitle);
        }

        protected void imgPosterImage_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgPosterImage = sender as ImageButton;                        
            string mediaTitle = imgPosterImage.CommandArgument;

            playMedia(mediaTitle);
        }

        private void playMedia(string mediaTitle)
        {

            string mediaType = Session["mediaType"].ToString();
            string queryString = "?";

            queryString += "mediaType=" + mediaType;

            queryString += "&";

            queryString += "mediaTitle=" + mediaTitle;

            Response.Redirect("Play.aspx" + queryString);
        }

        protected void ddlMediaType_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["mediaType"] = (sender as DropDownList).SelectedValue;
        }

        protected void btnAddAllMedia_Click(object sender, EventArgs e)
        {
            string[] files = Directory.GetFiles(rootMobileMediaFolder, "*.*", SearchOption.AllDirectories);

            if (files.Length > 0)
            {
                MobileMediaDataContext context = new MobileMediaDataContext();

                foreach (string filePath in files)
                {
                    FileInfo file = new FileInfo(filePath);

                    string fileExt = file.Extension;
                    string mediaType = file.Directory.Name;

                    if ((mediaType.Equals("audio") && supportedAudioTypes.Contains(fileExt)) || (mediaType.Equals("video") && supportedVideoTypes.Contains(fileExt)))
                    {
                        string fileName = file.Name;

                        string mediaTitle = Path.GetFileNameWithoutExtension(fileName);
                        string posterImageUrl = "";

                        if(mediaType.Equals("audio"))
                            posterImageUrl = "../../images/albumcovers/music.jpg";
                        else
                            posterImageUrl = "../../images/posters/video.jpg";

                        if (!MobileMediaExists(mediaTitle))
                        {
                            MobileMedia mm = new MobileMedia
                            {
                                mobDateAdded = DateTime.Now,
                                mobAlbum = "",
                                mobArtist = "",
                                mobDescription = "",
                                mobFileName = fileName,
                                mobGenre = "",
                                mobIsViewable = 'Y',
                                mobMediaFileExt = fileExt,
                                mobMediaTitle = mediaTitle,
                                mobMediaType = mediaType,
                                mobPosterImageUrl = posterImageUrl,
                                mobRating = 0
                            };

                            context.MobileMedias.InsertOnSubmit(mm);

                            context.SubmitChanges();
                        }
                    }
                }
            }
        }

        private bool MobileMediaExists(string mediaTitle)
        {
            MobileMediaDataContext context = new MobileMediaDataContext();

            var result = from mm in context.MobileMedias
                         where mm.mobMediaTitle.Equals(mediaTitle)
                         select mm;

            return result.Count() > 0;
        }
    }
}