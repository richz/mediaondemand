<%@ Page Language="C#" MasterPageFile="~/LoggedOut.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="MediaOnDemand.PasswordRecovery" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <center>
    <asp:PasswordRecovery ID="passwordRecovery" runat="server" 
            SuccessPageUrl="~/pages/Home.aspx">
        <QuestionTemplate>
            <table border="0" cellpadding="1" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                    Identity Confirmation</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    Answer the following question to receive your password.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    User Name:</td>
                                <td>
                                    <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Question:</td>
                                <td>
                                    <asp:Literal ID="Question" runat="server"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Answer:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ErrorMessage="Answer is required." 
                                        ToolTip="Answer is required." ValidationGroup="passwordRecovery">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td align="left">
                                <asp:Button ID="btnCancel" PostBackUrl="~/pages/Login.aspx" runat="server" Text="Cancel" />
                            </td>
                                <td align="right">
                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
                                        ValidationGroup="passwordRecovery" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </QuestionTemplate>
        <UserNameTemplate>
            <table border="0" cellpadding="1" cellspacing="0" 
                style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table border="0" cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">
                                    Forgot Your Password?</td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2">
                                    Enter your User Name to receive your password.</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="passwordRecovery">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                            <td align="left">
                                <asp:Button ID="btnCancel" PostBackUrl="~/pages/Login.aspx" runat="server" Text="Cancel" />
                            </td>
                                <td align="right">
                                    <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" 
                                        ValidationGroup="passwordRecovery" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </UserNameTemplate>
    </asp:PasswordRecovery>
    </center>
</asp:Content>
