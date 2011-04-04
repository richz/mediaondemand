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
                        ).Take(10);
           
        }
    }
}