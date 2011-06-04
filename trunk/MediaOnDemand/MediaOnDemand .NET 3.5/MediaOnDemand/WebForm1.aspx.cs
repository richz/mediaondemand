using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MediaOnDemand
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.imgStar1.Attributes.Add("onmouseover", "SetStars('" + imgStar1.ClientID + "', 1)");
                this.imgStar2.Attributes.Add("onmouseover", "SetStars('" + imgStar2.ClientID + "', 2)");
                this.imgStar3.Attributes.Add("onmouseover", "SetStars('" + imgStar3.ClientID + "', 3)");
                this.imgStar4.Attributes.Add("onmouseover", "SetStars('" + imgStar4.ClientID + "', 4)");
                this.imgStar5.Attributes.Add("onmouseover", "SetStars('" + imgStar5.ClientID + "', 5)");

                this.imgStar1.Attributes.Add("onmouseout", "UnSetStars('" + imgStar1.ClientID + "', 1)");
                this.imgStar2.Attributes.Add("onmouseout", "UnSetStars('" + imgStar2.ClientID + "', 2)");
                this.imgStar3.Attributes.Add("onmouseout", "UnSetStars('" + imgStar3.ClientID + "', 3)");
                this.imgStar4.Attributes.Add("onmouseout", "UnSetStars('" + imgStar4.ClientID + "', 4)");
                this.imgStar5.Attributes.Add("onmouseout", "UnSetStars('" + imgStar5.ClientID + "', 5)");



            }
        }
    }
}