<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebsiteAdministration.aspx.cs" Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <script src="../js/WebAdmin.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
    </asp:ToolkitScriptManager>
   
    <asp:HiddenField ID="hdnTitle" runat="server" />
   <asp:HiddenField ID="hdnLocation" runat="server" />
   <asp:HiddenField ID="hdnIsViewable" runat="server" />
   <asp:HiddenField ID="hdnArtist" runat="server" />
   <asp:HiddenField ID="hdnDescription" runat="server" />
   <asp:HiddenField ID="hdnGenre" runat="server" />
   <asp:HiddenField ID="hdnMediaType" runat="server" />
   <asp:HiddenField ID="hdnDuration" runat="server" />
   <asp:HiddenField ID="hdnAlbum" runat="server" />
   <asp:HiddenField ID="hdnMedId" runat="server" />
   
   <asp:HiddenField ID="hdnUpdateMode" runat="server" />
   
    <h1>Website Administration</h1>    
    <table>
        <tr>
            <td>
                <asp:Label ID="lblChooseMediaType" runat="server" Text="Please choose a media type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediaTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged">
                    <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>
                    <asp:ListItem Value="music">Music</asp:ListItem>
                    <asp:ListItem Value="all">All</asp:ListItem>
                </asp:DropDownList>
               
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td align="left">
                            <asp:Button ID="btnApplyChanges" runat="server" Text="Apply changes"
                                OnClick="btnApplyChanges_Click" />
                        </td>
                        <td align="right">
                            <asp:Button ID="btnAddNewMediaRow" runat="server" Text="Add new media" OnClick="btnAddNewMediaRow_Click" />
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
        <tr>
            <td>
               
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:GridView ID="gvMedia" runat="server" AutoGenerateColumns="False" DataSourceID="lnqMedia"
                    EnableModelValidation="True" DataKeyNames="medId" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AllowPaging="True" AllowSorting="True" OnRowDeleted="gvMedia_RowDeleted">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Bind("medId") %>' runat="server"
                                    OnClick="lnkEdit_Click">Edit</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="medTitle" HeaderText="Title" SortExpression="medTitle" />
                        <asp:BoundField DataField="medLocation" HeaderText="Location" SortExpression="medLocation" />
                        <asp:BoundField DataField="medDescription" HeaderText="Description" SortExpression="medDescription" />
                        <asp:BoundField DataField="medIsViewable" HeaderText="IsViewable" SortExpression="medIsViewable" />
                        <asp:BoundField DataField="medDateAdded" HeaderText="DateAdded" SortExpression="medDateAdded" />
                        <asp:BoundField DataField="medArtist" HeaderText="Artist" SortExpression="medArtist" />
                        <asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />
                        <asp:BoundField DataField="medMediaType" HeaderText="Media Type" SortExpression="medMediaType" />
                        <asp:BoundField DataField="medDuration" HeaderText="Duration" SortExpression="medDuration" />
                        <asp:BoundField DataField="medAlbum" HeaderText="Album" SortExpression="medAlbum" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="medId" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="medId" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        <center>
                            <asp:Label ID="lblNoRecsFound" runat="server" Text="No records found"></asp:Label>
                        </center>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
            <td>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:UpdatePanel ID="upFolderStatus" runat="server">
        <ContentTemplate>
            <asp:Label ID="lblFolderMessage" runat="server" ForeColor="Red"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias" Where="medMediaType == @medMediaType" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlMediaTypes" Name="medMediaType" PropertyName="SelectedValue"
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
