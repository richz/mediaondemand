using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using System.Drawing;

namespace MediaFileWatcherClient
{
    public class SysTrayApp : Form
    {

        private enum MessageList
        {
            Add = 0,
            Rename = 1,
            Delete = 2
        }
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.Run(new SysTrayApp());
        }

        private NotifyIcon trayIcon;

        private ContextMenu trayMenu;

        public SysTrayApp()
        {
            trayMenu = new ContextMenu();

            trayMenu.MenuItems.Add("Exit", OnExit);

            trayIcon = new NotifyIcon();

            trayIcon.Text = "Notification";

            trayIcon.Icon = new Icon(SystemIcons.Application, 40, 40);

            trayIcon.ContextMenu = trayMenu;

            trayIcon.Visible = true;

            trayIcon.BalloonTipText = "";
        }

        protected override void OnLoad(EventArgs e)
        {

            Visible = false; // Hide form window.

            ShowInTaskbar = false; // Remove from taskbar.

            base.OnLoad(e);

        }

        //protected override void WndProc(ref Message message)
        //{
        //    trayIcon.BalloonTipIcon = new ToolTipIcon();

        //    bool messageHandled = false;

        //    //filter the RF_TESTMESSAGE
        //    if (message.Msg == 1)
        //    {
        //        trayIcon.BalloonTipText = "File was added";
        //        messageHandled = true;
        //    }
        //    else if (message.Msg == 2)
        //    {
        //        trayIcon.BalloonTipText = "File was renamed";
        //        messageHandled = true;
        //    }
        //    else if (message.Msg == 3)
        //    {
        //        trayIcon.BalloonTipText = "File was deleted";
        //        messageHandled = true;
        //    }
                        
        //    if(messageHandled)
        //        trayIcon.ShowBalloonTip(3);

        //    //be sure to pass along all messages to the base also
        //    base.WndProc(ref message);
        //}

        private void OnExit(object sender, EventArgs e)
        {

            Application.Exit();

        }

        protected override void Dispose(bool isDisposing)
        {

            if (isDisposing)
            {

                // Release the icon resource.

                trayIcon.Dispose();

            }

            base.Dispose(isDisposing);

        }
    }
}
