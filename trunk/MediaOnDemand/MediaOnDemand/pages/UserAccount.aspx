<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="MediaOnDemand.UserAccount"%>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">

 <h1 id="PageHeader">MY ACCOUNT</h1>   

 <div style="width:95%">
<table style="margin-left:auto; margin-right:auto">
<tr>
<td align="center">
    <asp:HyperLink ID="lnkChangePassword" NavigateUrl="~/pages/ChangePassword.aspx" runat="server">Change Password</asp:HyperLink>
</td>
</tr>
<tr>
<td align="center">
    <asp:HyperLink ID="lnkUserProfile" runat="server">User Profile</asp:HyperLink>
</td>
</tr>

</table>
</div>

</asp:Content>

