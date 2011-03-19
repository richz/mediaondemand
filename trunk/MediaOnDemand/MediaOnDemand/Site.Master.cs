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
                Response.Redirect("~/pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    this.MainContent.Page.Title = "Media On Demand - " + Membership.GetUser().UserName;



                }
                else
                {
                    this.MainContent.Page.Title = "Media On Demand - Guest";
                }
            }


            // Allowing only for development purposes
            //if (HttpContext.Current.User.Identity.IsAuthenticated)
            //{
                //if (HttpContext.Current.User.IsInRole("Site Administrator"))
                //{
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Media", "", "", "~/pages/WebsiteAdministration.aspx"));
                //}
                //if (HttpContext.Current.User.IsInRole("Administrator"))
                //{
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Users", "", "", "~/pages/UserManagement.aspx"));
                //}
            //}
        }

    }
}
