<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="MediaOnDemand.Account.ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Change Password
    </h2>
    <p>
        Use the form below to change your password.
    </p>
    <p>
        New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.
    </p>
    <asp:ChangePassword ID="passwordChange" runat="server" 
        CancelDestinationPageUrl="~/pages/Login.aspx" CreateUserText="Create account" 
        CreateUserUrl="~/pages/Register.aspx" PasswordRecoveryText="Forgot password" 
        PasswordRecoveryUrl="~/pages/PasswordRecovery.aspx" 
        SuccessPageUrl="~/pages/Login.aspx">
        <MailDefinition Subject="Password change">
        </MailDefinition>
    </asp:ChangePassword>
</asp:Content>
