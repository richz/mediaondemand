using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace MediaOnDemand.UserControls
{
    public partial class UserMediaPlaylist : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(String.IsNullOrEmpty(this.hdnUserName.Value))
                this.hdnUserName.Value = Membership.GetUser().UserName;
        }
    }
}