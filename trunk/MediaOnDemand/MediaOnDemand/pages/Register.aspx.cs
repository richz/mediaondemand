using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;

namespace MediaOnDemand
{
    public partial class Register : System.Web.UI.Page
    {
        #region Page Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #endregion

        #region Control Event Handlers

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            //FormsAuthentication.SetAuthCookie(CreateUser.UserName, true);
            
        }

        protected void CreateUser_CreatedUser(object sender, EventArgs e)
        {
           Roles.AddUserToRole((sender as CreateUserWizard).UserName, "Basic User");
        }

        #endregion

    }
}
