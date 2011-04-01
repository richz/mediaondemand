<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs"
    Inherits="MediaOnDemand.UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        USER ADMINISTRATION</h1>
    <asp:HiddenField ID="hdnUserName" runat="server" />
    <center>
        <asp:Label ID="lblUserName" Font-Bold="true" runat="server" Text=""></asp:Label>
        <br />
        <div class="mediaGrid">
        <asp:GridView ID="gvUsers" CssClass="mediaGrid" Height="100%" Width="100%" runat="server"
            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="lnqUsers"
            CellPadding="4" ForeColor="#333333" GridLines="None">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <Columns>
                <%--<asp:CommandField ShowDeleteButton="True" />--%>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" CommandArgument='<%# Bind("UserName") %>' runat="server"
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
        </div>
    </center>
    <asp:LinqDataSource ID="lnqUsers" runat="server" ContextTypeName="MediaOnDemand.UserManagementDataContext"
        TableName="aspnet_Users" EnableDelete="True">
    </asp:LinqDataSource>
</asp:Content>
