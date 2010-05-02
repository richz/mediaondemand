<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="MediaOnDemand.UserAccount" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftColumn" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

<table>
<tr>
<td>
    <asp:HyperLink ID="lnkChangePassword" NavigateUrl="~/pages/ChangePassword.aspx" runat="server">Change Password</asp:HyperLink>
</td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="lnkUserProfile" runat="server">User Profile</asp:HyperLink>
</td>
</tr>
<tr>
<td>
    <asp:HyperLink ID="lnkSiteTheme" runat="server">Change site look and feel</asp:HyperLink>
</td>
</tr>
</table>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="RightColumn" runat="server">
</asp:Content>
