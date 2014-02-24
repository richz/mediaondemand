using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class MediaMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CustomSessionId"] == null)
            {
                Response.Redirect("~/pages/Login.aspx");
            }

            if (!IsPostBack)
            {
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                    Response.Redirect("~/pages/Login.aspx");
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
                    this.NavigationMenu.Items.Add(new MenuItem("Administer Mobile Media", "", "", "~/mobile/pages/Admin.aspx"));
                }
            }

        }

        private bool CurrentUserIsInRole(string role)
        {
            return HttpContext.Current.User.IsInRole(role);
        }
    }
}