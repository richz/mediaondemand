<%@ Page Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MediaOnDemand.Home" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<%--<title>Media On Demand</title> --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
     <h1>HOME</h1>   
    
    <table width="85%">
    <tr>
    <td>
    <h1>MOVIES</h1>   
    </td>
    </tr>
    <tr>
    <td>
    <h1>MUSIC</h1> 
    </td>
    </tr>
    </table>
    
    
    

</asp:Content>
