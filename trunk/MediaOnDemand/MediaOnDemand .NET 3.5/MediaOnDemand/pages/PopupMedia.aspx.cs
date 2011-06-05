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
        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            int mediaId = Convert.ToInt32(Request.QueryString["mediaId"]);        
        }

        #endregion

        #region Controls Event Handlers

        protected void btnSaveMediaPlayed_Click(object sender, EventArgs e)
        {
            try
            {
                int id = Convert.ToInt32(this.hdnMediaId.Value);

                StorageMediaDataContext context = new StorageMediaDataContext();


                StoredMedia sm = (from storedMedia in context.StoredMedias
                                  where storedMedia.medId == id
                                  orderby storedMedia.medDateAdded descending
                                  select storedMedia).First();


                sm.medLastPlayedDate = DateTime.Now;

                context.SubmitChanges();
            }
            catch (Exception ex)
            {

            }

            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }

        #endregion

        #region Static Methods

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

        #endregion

        #region Helper Methods

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

        #endregion
    }
}
