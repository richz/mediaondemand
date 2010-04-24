<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewMedia.aspx.cs" Inherits="MediaOnDemand.pages.AddNewMedia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <table>
                <tr style="background-color: #5D7B9D; color: white;">
                    <td colspan="2" style="text-align: center;">
                        <asp:Label ID="lblHeader" runat="server" Text="Media Info"></asp:Label>
                    </td>
                </tr>
                <tr style="background-color: #F7F6F3; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblTitle" runat="server" Text="Title">
                        </asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: White; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: #F7F6F3; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblIsViewable" runat="server" Text="Is Viewable"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:DropDownList ID="ddlIsViewable" runat="server">
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                            <asp:ListItem Value="N">No</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="background-color: white; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblArtist" runat="server" Text="Artist"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtArtist" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: #F7F6F3; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: white; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: #F7F6F3; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblMediaType" runat="server" Text="Media Type"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:DropDownList ID="ddlMediaType" runat="server">
                            <asp:ListItem Value="movie">Movie</asp:ListItem>
                            <asp:ListItem Value="music">Music</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr style="background-color: white; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="background-color: #F7F6F3; color: #333333;">
                    <td style="text-align:right">
                        <asp:Label ID="lblAlbum" runat="server" Text="Album"></asp:Label>
                    </td>
                    <td style="text-align:left">
                        <asp:TextBox ID="txtAlbum" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    </form>
</body>
</html>
