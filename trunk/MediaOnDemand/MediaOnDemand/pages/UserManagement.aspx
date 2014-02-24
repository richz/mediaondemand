<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs"
    Inherits="MediaOnDemand.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1 id="PageHeader">
        USER ADMINISTRATION</h1>
    <asp:HiddenField ID="hdnUserName" runat="server" />
    <asp:Label ID="lblUserName" Font-Bold="true" runat="server" Text=""></asp:Label>
    <table width="100%">
        <tr>
            <td align="right">
                <%--<a href="Register.aspx">
                        <img alt="Add User" src="../images/Buttons/addButton.jpg" />
                    </a>--%>
            </td>
        </tr>
    </table>
    <div class="mediaGrid">
        <table width="100%">
        <tr>
                <td align="center">
                <h1>
                Create new user
                </h1>
                    <asp:CreateUserWizard ID="CreateUserWizard" runat="server" 
                        CreateUserButtonText="Next" DisplaySideBar="True" LoginCreatedUser="False" 
                        oncontinuebuttonclick="CreateUserWizard_ContinueButtonClick" 
                        onfinishbuttonclick="CreateUserWizard_FinishButtonClick" 
                        onnextbuttonclick="CreateUserWizard_NextButtonClick">
                        <WizardSteps>
                            <asp:CreateUserWizardStep ID="CreateUserWizardStep" runat="server" 
                                Title="Basic Information">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td align="center" colspan="2">
                                                Basic Information
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                                    ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                                    ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword"
                                                    ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required."
                                                    ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email"
                                                    ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question"
                                                    ErrorMessage="Security question is required." ToolTip="Security question is required."
                                                    ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer"
                                                    ErrorMessage="Security answer is required." ToolTip="Security answer is required."
                                                    ValidationGroup="CreateUserWizard">*</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password"
                                                    ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match."
                                                    ValidationGroup="CreateUserWizard"></asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color: Red;">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <CustomNavigationTemplate>
                                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                                        <tr align="right">
                                            <td align="right" colspan="0">
                                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                                    Text="Next" ValidationGroup="CreateUserWizard" />
                                            </td>
                                        </tr>
                                    </table>
                                </CustomNavigationTemplate>
                            </asp:CreateUserWizardStep>
                            <asp:WizardStep runat="server" Title="Add user roles">
                            <table>
                            <tr>
                            <td>
                                <asp:CheckBoxList ID="cblRoles" runat="server" DataSourceID="lnqRoles" 
                                    DataTextField="RoleName" DataValueField="LoweredRoleName">

                                </asp:CheckBoxList>
                                <asp:LinqDataSource ID="lnqRoles" runat="server" 
                                    ContextTypeName="MediaOnDemand.UserManagementDataContext" 
                                    Select="new (RoleName, RoleId, LoweredRoleName)" TableName="aspnet_Roles">
                                </asp:LinqDataSource>
                            </td>                            
                            </tr>
                            </table>
                            </asp:WizardStep>
                            <asp:CompleteWizardStep ID="CompleteWizardStep" runat="server">
                                <ContentTemplate>
                                    <table>
                                        <tr>
                                            <td align="center">
                                                Complete
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                The account has been successfully created.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue"
                                                    Text="Create another user" ValidationGroup="CreateUserWizard" />
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                            </asp:CompleteWizardStep>
                        </WizardSteps>
                        <FinishNavigationTemplate>
                            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                                CommandName="MovePrevious" Text="Previous" />
                            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                                Text="Finish" />
                        </FinishNavigationTemplate>
                        <SideBarTemplate>
                            <asp:DataList ID="SideBarList" runat="server">
                                <ItemTemplate>
                                    <asp:Label ID="SideBarLabel" runat="server"></asp:Label>
                                </ItemTemplate>
                                <SelectedItemStyle Font-Bold="True" />
                            </asp:DataList>
                        </SideBarTemplate>
                        
                        <StartNavigationTemplate>
                            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                                Text="Next" />
                        </StartNavigationTemplate>
                        <StepNavigationTemplate>
                            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" 
                                CommandName="MovePrevious" Text="Previous" />
                            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" 
                                Text="Next" />
                        </StepNavigationTemplate>
                    </asp:CreateUserWizard>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="gridViewPanel" CssClass="gridViewPanel" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="gvUsers" Height="100%" Width="100%" runat="server" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" DataSourceID="lnqUsers" CellPadding="4"
                            ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <%--<asp:CommandField ShowDeleteButton="True" />--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDelete" CommandArgument='<%# Bind("UserName") %>' runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                            OnClick="lnkDelete_Click">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                <asp:BoundField DataField="MobileAlias" HeaderText="Mobile Alias" SortExpression="MobileAlias" />
                                <asp:CheckBoxField DataField="IsAnonymous" HeaderText="Is Anonymous" SortExpression="IsAnonymous" />
                                <asp:BoundField DataField="LastActivityDate" HeaderText="Last Activity Date" SortExpression="LastActivityDate" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </asp:Panel>
                </td>
            </tr>
            
        </table>
    </div>
    <asp:LinqDataSource ID="lnqUsers" runat="server" ContextTypeName="MediaOnDemand.UserManagementDataContext"
        TableName="aspnet_Users" EnableDelete="True">
    </asp:LinqDataSource>
</asp:Content>
