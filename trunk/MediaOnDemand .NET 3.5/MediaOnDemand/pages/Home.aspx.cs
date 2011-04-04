using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;

namespace MediaOnDemand
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnqLatestMedia_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            StorageMediaDataContext db = new StorageMediaDataContext();

            e.Result = (
                            from sm in db.StoredMedias
                            orderby sm.medDateAdded descending
                            select sm
                        ).Take(15);

        }

        protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
        {
            this.dvLatestMedia.PageIndex -= 1;

            if (this.dvLatestMedia.PageIndex == 0)
                this.btnPrevious.Visible = false; 
            
            if (this.dvLatestMedia.PageIndex < this.dvLatestMedia.PageCount - 1)
                this.btnNext.Visible = true;
        }

        protected void btnNext_Click(object sender, ImageClickEventArgs e)
        {
            this.dvLatestMedia.PageIndex += 1;

            if (this.dvLatestMedia.PageIndex > 0)
                this.btnPrevious.Visible = true;

            if (this.dvLatestMedia.PageIndex == this.dvLatestMedia.PageCount - 1)
                this.btnNext.Visible = false;
        }
    }
}