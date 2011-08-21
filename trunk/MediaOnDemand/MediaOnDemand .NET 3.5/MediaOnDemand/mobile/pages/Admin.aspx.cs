using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace MediaOnDemand.mobile.pages
{
    public partial class Admin : System.Web.UI.Page
    {
        static string rootMobileMediaFolder = @"\\MEDIASERVER\MobileMediaFiles";
        static string videoFolder = rootMobileMediaFolder + @"\video";        
        static string audioFolder = rootMobileMediaFolder + @"\audio";
        public static List<string> supportedVideoTypes = new List<string> { ".mov" };
        public static List<string> supportedAudioTypes = new List<string> { ".mp4", ".mp3" };

        static string rootImagesPath = HttpContext.Current.Request.PhysicalApplicationPath + @"images";
        static string videoImagePath = Admin.rootImagesPath + @"\posters\";
        static string audioImagePath = Admin.rootImagesPath + @"\albumcovers\";

        private List<KeyValuePair<string, string>> mediaList = new List<KeyValuePair<string, string>>();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAddAllVideo_Click(object sender, EventArgs e)
        {
            PopulateMediaList("video");
            AddAllMobileMedia("video");
        }

        protected void btnAddAllAudio_Click(object sender, EventArgs e)
        {
            PopulateMediaList("audio");
            AddAllMobileMedia("audio");
        }

        private void AddAllMobileMedia(string mediaType)
        {
            string[] files = new string[0];

            if(mediaType.Equals("video"))
                files = Directory.GetFiles(videoFolder, "*.*", SearchOption.AllDirectories);
            else if (mediaType.Equals("audio"))
                files = Directory.GetFiles(audioFolder, "*.*", SearchOption.AllDirectories);

            if (files.Length > 0)
            {
                MobileMediaDataContext context = new MobileMediaDataContext();

                foreach (string filePath in files)
                {
                    FileInfo file = new FileInfo(filePath);

                    string fileExt = file.Extension;
                    
                    if ((mediaType.Equals("video") && supportedVideoTypes.Contains(fileExt)) || (mediaType.Equals("audio") && supportedAudioTypes.Contains(fileExt)))
                    {
                        string fileName = file.Name;

                        string mediaTitle = Path.GetFileNameWithoutExtension(fileName);
                        string posterImageUrl = "";

                        if (mediaType.Equals("video"))
                        {
                            if(File.Exists(videoImagePath + mediaTitle + ".jpg"))
                                posterImageUrl = String.Format("../../images/posters/{0}.jpg",mediaTitle);
                            else
                                posterImageUrl = "../../images/posters/video.jpg";
                        }
                        else if (mediaType.Equals("audio"))
                        {
                            if(File.Exists(audioImagePath + mediaTitle + ".jpg"))
                                posterImageUrl = String.Format("../../images/albumcovers/{0}.jpg", mediaTitle);
                            else
                                posterImageUrl = "../../images/albumcovers/audio.jpg";
                        }

                        if (!MobileMediaExists(mediaType, mediaTitle))
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

        private bool MobileMediaExists(string mediaType, string mediaTitle)
        {
            bool mobileMediaExists = false;

            for (int i = 0; i < mediaList.Count; i++)
            {
                if (mediaList[i].Key.Equals(mediaType) && mediaList[i].Value.Equals(mediaTitle))
                    mobileMediaExists = true;
            }

            return mobileMediaExists;
        }

        private void PopulateMediaList(string mediaType)
        {
            this.mediaList.Clear();
            List<string> mediaTypes = new List<string>();
            List<string> mediaTitles = new List<string>();

            MobileMediaDataContext context = new MobileMediaDataContext();

            var types = from mm in context.MobileMedias
                         where mm.mobMediaType.Equals(mediaType)
                         orderby mm.mobId
                        select mm.mobMediaType;

            var titles = from mm in context.MobileMedias
                         where mm.mobMediaType.Equals(mediaType)
                         orderby mm.mobId
                         select mm.mobMediaTitle;

            mediaTypes = types.ToList();
            mediaTitles = titles.ToList();

            for(int i = 0; i < mediaTypes.Count; i++)
            {
                mediaList.Add(new KeyValuePair<string,string>(mediaTypes[i],mediaTitles[i]));
            }            
        }

        protected void btnDeleteAllMobileMedia_Click(object sender, EventArgs e)
        {
            MobileMediaDataContext context = new MobileMediaDataContext();

            foreach (MobileMedia mm in context.MobileMedias)
                context.MobileMedias.DeleteOnSubmit(mm);

            context.SubmitChanges();
        }
    }
}