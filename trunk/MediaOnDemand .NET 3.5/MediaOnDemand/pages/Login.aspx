<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="MediaOnDemand.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <div style="padding-top:100px">
            <asp:Login ID="mainLogin" runat="server" CreateUserText="Create an account" CreateUserUrl="~/pages/Register.aspx"
                DestinationPageUrl="~/pages/Home.aspx" PasswordRecoveryUrl="~/pages/PasswordRecovery.aspx"
                PasswordRecoveryText="Forgot Password?" OnLoggedIn="mainLogin_LoggedIn" OnLoad="mainLogin_Load">
                <LayoutTemplate>
                    <table border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">
                                            Log In
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="mainLogin" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <center>
                                                <asp:HyperLink ID="CreateUserLink" runat="server" NavigateUrl="~/pages/Register.aspx">Create an account</asp:HyperLink>
                                            </center>
                                        </td>
                                        <tr>
                                            <td colspan="2">
                                                <center>
                                                    <asp:HyperLink ID="PasswordRecovery" runat="server" NavigateUrl="~/pages/PasswordRecovery.aspx">Forgot your password?</asp:HyperLink>
                                                </center>
                                            </td>
                                        </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
            <center>
            <br />
                <asp:HyperLink ID="ContinueAsGuest" runat="server" NavigateUrl="~/pages/Home.aspx">Continue as guest</asp:HyperLink>
            </center>
        </div>
    </center>
</asp:Content>
