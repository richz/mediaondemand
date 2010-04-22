<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewMedia.ascx.cs"
    Inherits="MediaOnDemand.webcontrols.AddNewMedia" %>
<div>
    <table>    
        <tr style="background-color: #5D7B9D; color: white;">
            <td colspan="2" style="text-align:center;">
                <asp:Label ID="lblHeader" runat="server" Text="Media Info"></asp:Label>
            </td>
        </tr>
        <tr style="background-color: #F7F6F3; color: #333333;">
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="Title">
                </asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: White; color: #333333;">
            <td>
                <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #F7F6F3; color: #333333;">
            <td>
                <asp:Label ID="lblIsViewable" runat="server" Text="Is Viewable"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlIsViewable" runat="server">
                    <asp:ListItem Value="Y">Yes</asp:ListItem>
                    <asp:ListItem Value="N">No</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="background-color: white; color: #333333;">
            <td>
                <asp:Label ID="lblArtist" runat="server" Text="Artist"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtArtist" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #F7F6F3; color: #333333;">
            <td>
                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: white; color: #333333;">
            <td>
                <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #F7F6F3; color: #333333;">
            <td>
                <asp:Label ID="lblMediaType" runat="server" Text="Media Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediaType" runat="server">
                    <asp:ListItem Value="movie">Movie</asp:ListItem>
                    <asp:ListItem Value="music">Music</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="background-color: white; color: #333333;">
            <td>
                <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="background-color: #F7F6F3; color: #333333;">
            <td>
                <asp:Label ID="lblAlbum" runat="server" Text="Album"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtAlbum" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
</div>
