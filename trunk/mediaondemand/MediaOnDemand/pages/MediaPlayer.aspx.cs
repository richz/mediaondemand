using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class MediaPlayer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Media_Player_Control_Load(object sender, EventArgs e)
        {
            this.Media_Player_Control.MovieURL = Request.QueryString["file"];
        }
    }
}