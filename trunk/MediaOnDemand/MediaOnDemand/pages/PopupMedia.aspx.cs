using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;


namespace MediaOnDemand.pages
{
    public partial class PopupMedia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int mediaId = Convert.ToInt32(Request.QueryString["mediaId"]);


            
            //this.lblMediaTitle.Text = this.hdnMediaTitle.Value = GetMediaTitleFromId(mediaId);
                         
            //this.hdnMediaUrl.Value = GetMediaUrlFromId(Convert.ToInt32(Request.QueryString["mediaId"]));
        
        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static string GetUrl(int mediaId)
        {
            string mediaUrl = "";

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medId == mediaId)
                    mediaUrl = sm.medLocation;
            }

            return mediaUrl;

        }

        private string GetMediaUrlFromId(int mediaId)
        {
            string mediaUrl = "";

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach(StoredMedia sm in context.StoredMedias)
            {
                if (sm.medId == mediaId)
                    mediaUrl = sm.medLocation;
            }

            return mediaUrl;
        }

        private string GetMediaTitleFromId(int mediaId)
        {
            string mediaTitle = "";

            StorageMediaDataContext context = new StorageMediaDataContext();

            foreach (StoredMedia sm in context.StoredMedias)
            {
                if (sm.medId == mediaId)
                    mediaTitle = sm.medTitle;
            }

            return mediaTitle;
        }



    }
}
