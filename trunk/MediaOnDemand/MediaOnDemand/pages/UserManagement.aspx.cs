using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Collections.Generic;
using MediaOnDemandLibrary;

namespace MediaOnDemand
{
    public partial class UserManagement : System.Web.UI.Page
    {
        #region Page Event Handlers

        List<string> selectedRoles = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {
            this.lblUserName.Text = "";        
        }

        #endregion

        #region Control Event Handlers

        protected void lnkDelete_Click(object sender, EventArgs e)
        {            
            this.hdnUserName.Value = (sender as LinkButton).CommandArgument;

            this.DeleteUser(this.hdnUserName.Value);            
        }

        #endregion

        #region Helper Methods

        private void DeleteUser(string userName)
        {
            if (Membership.DeleteUser(userName, true))
                this.lblUserName.Text = "User " + userName + " has been deleted";

            this.gvUsers.DataBind();
        }

        #endregion

        protected void CreateUserWizard_ContinueButtonClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void CreateUserWizard_NextButtonClick(object sender, WizardNavigationEventArgs e)
        {

        }

        protected void CreateUserWizard_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            int currentStepIndex = e.CurrentStepIndex;
            CheckBoxList cblRoles = this.CreateUserWizard.WizardSteps[currentStepIndex].FindControl("cblRoles") as CheckBoxList;

            string userName = (WebHelper.GetControlById(this.CreateUserWizard.WizardSteps[0], "UserName") as TextBox).Text;

            foreach (ListItem role in cblRoles.Items)
            {
                if (role.Selected)
                    Roles.AddUserToRole(userName, role.Value);
            }
        }
    }
}
