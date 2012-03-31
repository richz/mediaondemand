using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

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
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (CurrentUserIsInRole("Basic User"))
                {
                    this.NavigationMenu.Items.Add(new MenuItem("My Account", "", "", "~/pages/UserAccount.aspx"));                    
                }
                if (CurrentUserIsInRole("Site Administrator"))
                {                    
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Site", "", "", "~/pages/SiteAdministration.aspx"));
                }
                if (CurrentUserIsInRole("Administrator"))
                {
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Users", "", "", "~/pages/UserManagement.aspx"));
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Media", "", "", "~/pages/WebsiteAdministration.aspx"));
                }
            }           
             
        }

        private bool CurrentUserIsInRole(string role)
        {
            return HttpContext.Current.User.IsInRole(role);
        }
    }
}
