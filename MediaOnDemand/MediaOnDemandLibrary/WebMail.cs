using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace MediaOnDemandLibrary
{
    public class WebMail
    {
        public static void SendEmail(string emailRecipient,string bcc, string emailSubject, string body)
        {
            SMTP(emailRecipient, bcc, emailSubject, body);
        }

        public static void SMTP(/*string from,*/ string to, string bcc, string subject, string body)
        {
            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress("admin@MediaOnDemand.com");
            mailMsg.To.Add(to);
            mailMsg.Subject = subject;
            mailMsg.IsBodyHtml = true;
            mailMsg.BodyEncoding = Encoding.UTF8;
            mailMsg.Body = body;
            mailMsg.Priority = MailPriority.Normal;
            // Smtp configuration
            SmtpClient client = new SmtpClient();
            client.Credentials = new NetworkCredential("cpagu002@gmail.com", "12247805");
            client.Port = 587; //or use 465            
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            object userState = mailMsg;
            try
            {
                //you can also call client.Send(msg)
                client.SendAsync(mailMsg, userState);
            }
            catch (SmtpException)
            {
                //Catch errors...
            }
        }
    }

}
