<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MediaOnDemand.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <title>Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="main">
<center>
<table>
<tr>
<td>
    <asp:Image ID="imgPic1" ImageUrl="~/MediaFiles/Pictures/goku.gif" runat="server" />
</td>

</tr>

</table>

</center>
</div>
</asp:Content>
