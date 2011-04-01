using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MediaOnDemandLibrary;

namespace MediaOnDemand
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void mainLogin_LoggedIn(object sender, EventArgs e)
        {    
            
        }

        protected void mainLogin_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBox userNameBox = WebHelper.GetControlById(this.mainLogin, "UserName") as TextBox;
                userNameBox.Focus();
            }
        }
    }
}