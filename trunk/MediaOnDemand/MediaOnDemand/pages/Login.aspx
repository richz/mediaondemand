<%@ Page Title="" Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MediaOnDemand.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <title>Login Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
  <center>
  <div>
                <asp:Login ID="mainLogin" runat="server" DestinationPageUrl="~/pages/Home.aspx">
                    <LayoutTemplate>
                        <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                            <tr>
                                <td>
                                    <table cellpadding="0">
                                        <tr>
                                            <td align="center" colspan="2" 
                                                style="color:White;background-color:white;font-size:0.9em;font-weight:bold;">
                                                Log In</td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                    ToolTip="User Name is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                                    ToolTip="Password is required." ValidationGroup="mainLogin">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color:Red;">
                                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="2">
                                                <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                                    BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                                    Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="Log In" 
                                                    ValidationGroup="mainLogin" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                </asp:Login>
                </div>
                </center>
</asp:Content>
