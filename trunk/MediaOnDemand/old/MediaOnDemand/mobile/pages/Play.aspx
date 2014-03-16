<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Play.aspx.cs" Inherits="MediaOnDemand.mobile.pages.Play" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../../js/site.js" type="text/javascript"></script>
    <script src="../../js/AC_QuickTime.js" type="text/javascript"></script>
    <link href="../Styles/mobile.css" rel="stylesheet" type="text/css" />
    <title></title>
    
<script type="text/javascript" language="javascript">

    var mediaType = getQueryVariable('mediaType');
    var mediaTitle = getQueryVariable('mediaTitle');
    var mediaUrl = '../' + mediaType + '/' + mediaTitle;

    var ua = navigator.userAgent;
        if (ua.indexOf("iPhone") > 0) document.location.replace(mediaUrl);
	</script>

</head>
<body>
    <form id="form1" runat="server">
    <center>
		<video width="800px" height="600px" id="videoPlayer" controls>			
		</video>
	</center>
    <script type="text/javascript" language="javascript">

        var mediaType = getQueryVariable('mediaType');
        var mediaTitle = getQueryVariable('mediaTitle');
        var mediaUrl = '../../MediaFiles/MobileMediaFiles/' + mediaType + '/' + mediaTitle;

		var videoPlayer = document.getElementById('videoPlayer');
		videoPlayer.innerHTML  = '<source src="' + mediaUrl + '" type="video/mp4">';
		
        //QT_WriteOBJECT(mediaUrl, 'Width', 'Height+16', '', 'autoplay', 'true');
	</script>		
	
    </form>
</body>
</html>
