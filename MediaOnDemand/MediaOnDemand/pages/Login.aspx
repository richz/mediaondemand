<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MediaOnDemand.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Login Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
  <center>
  <div>
  
      <asp:Login ID="mainLogin" runat="server" CreateUserText="Create an account" 
          CreateUserUrl="~/pages/Register.aspx" DestinationPageUrl="~/pages/Home.aspx">
      </asp:Login>
     
                
                </div>
                </center>
</asp:Content>
