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

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                this.lnkLogin.Visible = false;
                this.lnkLogout.Visible = true;
            }
            else
            {
                this.lnkLogin.Visible = true;
                this.lnkLogout.Visible = false;
            }

            (this.Login.FindControl("lnkCancel") as LinkButton).Attributes.Add("onClick", "return false;");
            //this.lnkLoginVal.Attributes.Add("onClick", "return false;");
            this.lnkLogin.Attributes.Add("onClick", "return false;");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //string userName = this.txtUserName.Text;
            //string password = this.txtPassword.Text;

            //if (Membership.ValidateUser(userName, password))
            //{
            //    this.lblLoginError.Text = "";

            //    FormsAuthentication.SetAuthCookie(userName, false);
            //    Response.Redirect(Request.Url.ToString());
            //}
            //else
            //    this.lblLoginError.Text = "Invalid User Name and/or Password";
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(Request.Url.ToString());
        }

        protected void Login_LoginError(object sender, EventArgs e)
        {
            this.lblLoginError.Text = "Invalid username and/or password";
        }
    }
}
