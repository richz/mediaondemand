<%@ Page Title="" Language="C#" MasterPageFile="~/mobile/MobileLoggedOut.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MediaOnDemand.mobile.pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div style="width:100%; margin-left:auto; margin-right:auto">
    <asp:Login ID="mobileLogin" runat="server" 
        DestinationPageUrl="~/mobile/pages/Admin.aspx" OnLoad="mobileLogin_Load" 
        Width="100%">
                <LayoutTemplate>
                <div style="width:100%;margin-left:auto;margin-right:auto">
                    <table width="100%" border="0" cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0">
                                    <tr>
                                        <td align="center" colspan="2">
                                            Log In
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="padding-right:10px">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right"  style="padding-right:10px">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" align="right" colspan="2">
                                            <asp:Button ID="LoginButton" Width="75px" Height="30px" runat="server" CommandName="Login" Text="Log In" ValidationGroup="mainLogin" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                        </td>
                                    </tr>                                                                        
                                </table>
                            </td>
                        </tr>
                    </table>
                    </div>
                </LayoutTemplate>
            </asp:Login>
            <center>
            <br />
                <asp:HyperLink ID="ContinueAsGuest" runat="server" NavigateUrl="~/mobile/pages/WatchMovies.aspx">Continue as guest</asp:HyperLink>
            </center>
</div>

</asp:Content>
