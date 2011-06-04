<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupMedia.aspx.cs" Inherits="MediaOnDemand.pages.PopupMedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Media On Demand</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="../js/site.js" type="text/javascript"></script>
    <script src="../js/playMedia.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        window.onload = startVideo;
        window.onunload = cleanUp;

        function resize() {

            //var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            //var height = document.documentElement.scrollHeight;

            //document.getElementById('player').width = width;
            //document.getElementById('player').height = height;

        }

        function startVideo() {

            var browser = BrowserDetect.browser;

            var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            var height = document.documentElement.scrollHeight;
            var mediaType = getQueryVariable("mediaType");
            var mediaUrl = getQueryVariable("mediaUrl");
            var mediaPosition = getQueryVariable("mediaPos");

            if (browser == 'IE' || browser == 'FireFox') {
                if (mediaType == 'music') {

                    if (browser == 'IE')
                        self.resizeTo(400, 200);
                    else {
                        self.resizeTo(400, 145); 
                    }
                }
                else // video
                {
                    self.resizeTo(400, 350);
                }
            }
            else if (browser == 'Chrome') {

                if (mediaType == 'music') {

                    self.resizeTo(400, 200);
                }
                else // video
                {
                    self.resizeTo(400, 355);
                }
            }

            playMedia(mediaUrl, mediaType, true, mediaPosition);

        }

        function cleanUp() {

            try {
                window.opener.RemoveChildWindow();
            }
            catch (err)
                { }
        }

    </script>
</head>
<body style="background-color: Black; width: 100%; height: 100%">
    <form id="form" runat="server">
    <div>
        <center>
            <table>
                <tr>
                    <td colspan="2">
                        <div id="mediaPlayer">
                        </div>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias">
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaTitle" runat="server" />
    <asp:HiddenField ID="hdnMediaUrl" runat="server" />
    </form>
</body>
</html>
