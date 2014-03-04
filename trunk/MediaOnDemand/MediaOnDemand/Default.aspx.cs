using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.UserAgent.Contains("iPhone") || Request.UserAgent.Contains("iPad"))
                Response.Redirect("~/mobile/pages/WatchMovies.aspx");
            else
                Response.Redirect("~/pages/Login.aspx");
        }
    }
}