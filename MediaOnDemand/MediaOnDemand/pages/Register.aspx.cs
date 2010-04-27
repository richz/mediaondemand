using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;

namespace MediaOnDemand.Account
{
    public partial class Register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(CreateUser.UserName, true);
            
        }

        protected void CreateUser_CreatedUser(object sender, EventArgs e)
        {
           Roles.AddUserToRole((sender as CreateUserWizard).UserName, "Basic User");
        }

    }
}
