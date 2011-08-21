<%@ Page Title="" Language="C#" MasterPageFile="~/mobile/MobileLoggedOut.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="MediaOnDemand.mobile.pages.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />
    <div style="width:200px; margin-left:auto; margin-right:auto">
<asp:Button ID="btnAddAllVideo" Width="200px" Height="30px" runat="server" Text="Add All Video"
            OnClick="btnAddAllVideo_Click" />
<asp:Button ID="btnAddAllAudio" Width="200px" Height="30px" runat="server" Text="Add All Audio"
            OnClick="btnAddAllAudio_Click" />
    <asp:Button ID="btnDeleteAllMobileMedia" Width="200px" Height="30px" runat="server" Text="Delete All Media" 
        onclick="btnDeleteAllMobileMedia_Click" />
        </div>


</asp:Content>
