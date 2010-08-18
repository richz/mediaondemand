using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MediaOnDemand
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomSessionId"] == null)
            {
                //Response.Redirect("~/pages/Login.aspx");
            }

            if (!IsPostBack)
                ;//this.MainContent.Page.Title = "Media On Demand - " + Membership.GetUser().UserName;
        }
    }
}
