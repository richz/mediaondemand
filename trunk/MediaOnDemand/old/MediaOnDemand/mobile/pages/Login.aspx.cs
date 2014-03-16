using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MediaOnDemandLibrary;

namespace MediaOnDemand.mobile.pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void mobileLogin_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox userNameBox = WebHelper.GetControlById(this.mobileLogin, "UserName") as TextBox;
                userNameBox.Focus();
            }
        }
    }
}