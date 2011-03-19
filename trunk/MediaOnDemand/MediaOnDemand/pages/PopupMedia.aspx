<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopupMedia.aspx.cs" Inherits="MediaOnDemand.pages.PopupMedia" %>

<%@ Register Assembly="JW-FLV-Player-Control" Namespace="JW_FLV_Player_Control" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Media On Demand</title>
    <link href="../Styles/Site.css" rel="stylesheet" type="text/css" />

    <script src="../js/site.js" type="text/javascript"></script>

    <script src="../js/playMedia.js" type="text/javascript"></script>
    
     <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript" ></script>
    
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        window.onload = startVideo;

        function resize() {            

            //var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            //var height = document.documentElement.scrollHeight;

            //document.getElementById('player').width = width;
            //document.getElementById('player').height = height;
        
        }

        function startVideo() {

            var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            var height = document.documentElement.scrollHeight;
            var mediaTitle = getQueryVariable("title");
            var mediaUrl = getQueryVariable("mediaUrl");

            document.body.width = width;
            document.body.height = height;

            playMedia(mediaUrl, 'video', true);
        }


        function cleanUp() {
                    
            //var mediaTitle = getQueryVariable("title");
            //var mediaUrl = getQueryVariable("mediaUrl");

            //window.opener.showMediaInMainWindow(mediaUrl);
        
        }
            
    </script>

</head>
<body style="background-color:Black; width:100%; height:100%">
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
