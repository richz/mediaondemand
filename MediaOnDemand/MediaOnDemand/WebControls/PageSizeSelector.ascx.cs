using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace MediaOnDemandLibrary.WebControls
{
    public partial class PageSizeSelector : System.Web.UI.UserControl
    {
        GridView gridView;

        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            if (!this.ddlPageSize.SelectedValue.Equals("all"))
            {
                this.GetGridView().PageSize = Convert.ToInt32(this.ddlPageSize.SelectedValue);
            }
            else
                //this.GetGridView().PageSize = this.GetGridViewRecordCountByCurrentMediaType();

            this.GetGridView().PageIndex = 0;
            
        }

        private GridView GetGridView()
        {
            return null;
        }

    }
}