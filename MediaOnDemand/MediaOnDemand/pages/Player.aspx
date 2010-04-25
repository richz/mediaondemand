<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Player.aspx.cs" Inherits="MediaOnDemand.Player" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Media On Demand</title>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Runtime errors from Silverlight will be displayed here.
	This will contain debugging information and should be removed or hidden when debugging is completed -->
    <div id='errorLocation' style="font-size: small; color: Gray;">
    </div>
    <center>
        <cc1:media_player_control id="wmPlayer" height="350px" width="100%" autostart="true"
            runat="server" onload="wmPlayer_Load" />
        </td></tr>
    </center>
    </form>
</body>
</html>
