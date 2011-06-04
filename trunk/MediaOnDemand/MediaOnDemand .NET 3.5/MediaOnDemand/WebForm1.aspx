<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="MediaOnDemand.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="Styles/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
     

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <ul>
            <li style="float: left">
                <asp:ImageButton ID="imgStar1" ImageUrl="~/images/rating/ratingStarEmpty.png" runat="server" />
            </li>
            <li style="float: left">
                <asp:ImageButton ID="imgStar2" ImageUrl="~/images/rating/ratingStarEmpty.png" runat="server" />
            </li>
            <li style="float: left">
                <asp:ImageButton ID="imgStar3" ImageUrl="~/images/rating/ratingStarEmpty.png" runat="server" />
            </li>
            <li style="float: left">
                <asp:ImageButton ID="imgStar4" ImageUrl="~/images/rating/ratingStarEmpty.png" runat="server" />
            </li>
            <li style="float: left">
                <asp:ImageButton ID="imgStar5" ImageUrl="~/images/rating/ratingStarEmpty.png" runat="server" />
            </li>
        </ul>
    </div>
    </form>
</body>
</html>
