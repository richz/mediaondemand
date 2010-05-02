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
using System.Net;
using System.Net.Mail;
using MediaOnDemandLibrary;

namespace MediaOnDemand
{
    public partial class PasswordRecovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void passwordRecovery_SendingMail(object sender, MailMessageEventArgs e)
        {
            e.Cancel = true;

            MembershipUser user = Membership.GetUser(this.passwordRecovery.UserName);
            string userEmail = user.Email;

            string newPass = user.ResetPassword(this.passwordRecovery.Answer);

            (WebHelper.GetControlById(this.passwordRecovery, "lblNewPassword") as Label).Text = newPass;
            //(WebHelper.GetControlById(this.passwordRecovery, "lblUserEmail") as Label).Text = userEmail;
            
            //MembershipUser user = Membership.GetUser(this.passwordRecovery.UserName);
            //string userEmail = user.Email;

            //string newPass = user.ResetPassword(this.passwordRecovery.Answer);

            //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;
            //client.UseDefaultCredentials = false;
            //client.Credentials = new NetworkCredential("cpagu002@gmail.com", "12247805");

            //try
            //{
            //    client.Send("cpagu002@gmail.com", userEmail, "Media on Demand Password Recovery", "Please use this password to log in: \n" + newPass + "\n\n Remember to change your password the next time you log in.\n\n Thank you for using Media on Demand");

            //}
            //catch (Exception ex)
            //{ }
        }
    }
}
