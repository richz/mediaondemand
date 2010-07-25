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

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <!-- 
		include flowplayer JavaScript file that does  
		Flash embedding and provides the Flowplayer API.
	-->

    <script type="text/javascript" src="../js/swf flash player/flowplayer-3.2.2.min.js"></script>

    <!-- some minimal styling, can be removed -->
    <link rel="stylesheet" type="text/css" href="../Styles/style.css" />

    <script type="text/javascript">

        window.onload = startVideo;

        function resize() {

            var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            var height = document.documentElement.scrollHeight;

            //document.getElementById('player').width = width;
            //document.getElementById('player').height = height;

        }

        function startVideo() {

            var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
            var height = document.documentElement.scrollHeight;
            var mediaId = getQueryVariable("mediaId");
            var mediaUrl = getQueryVariable("mediaUrl");
            var mediaTitle = getQueryVariable("mediaTitle");

            document.body.width = width;
            document.body.height = height;

            document.getElementById('mediaTitle').innerHTML = mediaTitle;

            ForcePostBack('popup', mediaUrl, mediaTitle, 'video', '', mediaId)
        }


        function cleanUp() {

            window.opener.showMediaInMainWindow();

        }

        window.onresize = resize;
        window.onbeforeunload = cleanUp;
    
    </script>

</head>
<body style="background-color: Black; width: 100%; height: 100%" onresize="resize();">
    <form id="form" runat="server">
    <div>
        <center>
            <table>
            <tr>
            <td>
                 <h1 style="text-align:center;color:White" id="mediaTitle"></h1>                 
            </td>            
            </tr>
            <tr>
            <td></td>
            </tr>
                <tr>                
                    <td colspan="2">
                        <div id="mediaPlayer" class="hiddenMediaPlayer">
                            
                            <!-- this A tag is where your Flowplayer will be placed. it can be anywhere -->
                            
                            <a id="player" href="" style="display: block; width: 100%; height: 100%">
                                                                                 
                           </a>
                            
                        </div>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias">
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaId" runat="server" />
    <asp:HiddenField ID="hdnMediaUrl" runat="server" />
    <asp:HiddenField ID="hdnMediaTitle" runat="server" />
    </form>
</body>
</html>
