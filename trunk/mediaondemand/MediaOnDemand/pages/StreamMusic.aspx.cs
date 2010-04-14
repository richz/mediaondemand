using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace MediaOnDemand
{
    public partial class StreamMusic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void SongLinkButton_Click(object sender, EventArgs e)
        {
            LinkButton songLinkBtn = sender as LinkButton;

            string songLocation = songLinkBtn.CommandArgument.ToString();

             //ClientScript.RegisterClientScriptBlock(typeof(this), "download", "<script language=\"Javascript\">window.open('~/pages/MediaPlayer.aspx', 'Media Player', 'width=600,height=600,toolbar=1');</script>", true);

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>window.open('MediaPlayer.aspx?file=" + songLocation + "','Media Player','width=350');</script>"); 


            //Response.Write("<script language=\"javascript\" type=\"text/javascript\">window.open('','~/pages/MediaPlayer.aspx?file=" + songLocation + "','Media Player', 'width=300,height=200,menubar=yes,status=yes, location=yes,toolbar=yes,scrollbars=yes');</script>"); 
        }
        
    }
}