﻿using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                (this.mainLogin.FindControl("UserName") as TextBox).Focus();
        }
    }
}