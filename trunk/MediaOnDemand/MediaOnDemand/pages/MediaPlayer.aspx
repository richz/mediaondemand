<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MediaPlayer.aspx.cs" Inherits="MediaOnDemand.MediaPlayer" %>

<%@ Register Assembly="ASPNetVideo.NET3" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <%-- <cc1:Media_Player_Control ID="Media_Player_Control" runat="server" 
        onload="Media_Player_Control_Load" />--%>
        
    <ASPNetVideo:QuickTime ID="qtPlayer" OnLoad="QuickTime_Load" runat="server">
    </ASPNetVideo:QuickTime>
        
</asp:Content>
