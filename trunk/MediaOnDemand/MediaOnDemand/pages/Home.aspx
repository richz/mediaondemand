<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MediaOnDemand.Home" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
    
    <asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <title>Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="main">
<center>
<%--<table>
<tr>
<td>
    <asp:Image ID="imgPic1" ImageUrl="~/MediaFiles/Pictures/vegetassj2.gif" runat="server" />

</td>

</tr>
<tr>
<td>
 <cc1:Media_Player_Control ID="wmPlayer" Visible="true" Width="0px" Height="0px" 
        MovieURL="\\Iomega-0a7441\mediafiles\music\Other\aura.mp3" Volume="100" AutoStart="true"
                    runat="server" PlayCount="99" />  
</td>
</tr>
</table>--%>

</center>
</div>
</asp:Content>
