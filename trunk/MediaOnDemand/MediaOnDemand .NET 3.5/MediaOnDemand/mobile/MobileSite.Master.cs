using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand.mobile
{
    public partial class MobileSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVideo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/mobile/pages/WatchMovies.aspx");
        }

        protected void btnAudio_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/mobile/pages/StreamMusic.aspx");
        }        
    }
}