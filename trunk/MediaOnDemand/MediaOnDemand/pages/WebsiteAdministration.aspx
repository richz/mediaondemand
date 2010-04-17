<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebsiteAdministration.aspx.cs" Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/webAdmin.js" type="text/javascript"></script>
    <h1>
        Website Administration</h1>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblChooseMediaType" runat="server" Text="Please choose a media type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediaTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged">
                    <asp:ListItem Value="music" Selected="True">Music</asp:ListItem>
                    <asp:ListItem Value="movie">Movies</asp:ListItem>
                    <asp:ListItem Value="othervideo">Other Videos</asp:ListItem>
                    <asp:ListItem Value="pictures">Pictures</asp:ListItem>
                    <asp:ListItem Value="all">All</asp:ListItem>
                </asp:DropDownList>
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
    <asp:Button ID="btnApplyChanges" runat="server" Visible="false" 
            Text="Apply changes" onclick="btnApplyChanges_Click"/></td>
    <td align="right">
    <asp:Button ID="btnAddNewMediaRow" runat="server" Text="Add new media" 
            onclick="btnAddNewMediaRow_Click" /></td>
    </tr>
    </table>  
    </td>
    </tr>
    <tr>
    <td align="right">
    
        <asp:GridView ID="gvMedia" runat="server" AutoGenerateColumns="False" DataSourceID="lnqMedia"
            EnableModelValidation="True" DataKeyNames="medId" CellPadding="4" ForeColor="#333333"
            GridLines="None" AllowPaging="True" AllowSorting="True" 
            onrowediting="gvMedia_RowEditing" onrowdeleted="gvMedia_RowDeleted" 
            onrowupdated="gvMedia_RowUpdated">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:CommandField ShowCancelButton="False" ShowEditButton="True"
                    ShowSelectButton="True" />
                <%--<asp:BoundField DataField="medTitle" HeaderText="Title" SortExpression="medTitle" />--%>
                <asp:TemplateField>
                <HeaderTemplate>
                        <asp:Label ID="lblTitleColHeader" runat="Server">Title</asp:Label>
                </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblTitle" runat="Server"><%# Eval("medTitle")%></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtTitle" Width="100%" runat="server">
                        </asp:TextBox>
                    </FooterTemplate>
                </asp:TemplateField>
                <%--<asp:BoundField DataField="medLocation" HeaderText="Location" SortExpression="medLocation" />--%>
                <asp:TemplateField>
                 <HeaderTemplate>
                        <asp:Label ID="lblLocationColHeader" runat="Server">Location</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblLocation" Runat="Server"><%# Eval("medLocation")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtLocation" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medDateAdded" HeaderText="Date Added" SortExpression="medDateAdded" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblDateAddedColHeader" runat="Server">Date Added</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblDateAdded" Runat="Server"><%# Eval("medDateAdded")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtDateAdded" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medIsViewable" HeaderText="Is Viewable" SortExpression="medIsViewable" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblIsViewableColHeader" runat="Server">Is Viewable</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblIsViewable" Runat="Server"><%# Eval("medIsViewable")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtIsViewable" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medArtist" HeaderText="Artist" SortExpression="medArtist" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblArtistColHeader" runat="Server">Artist</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblArtist" Runat="Server"><%# Eval("medArtist")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtArtist" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medDescription" HeaderText="Description" SortExpression="medDescription" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblDescriptionColHeader" runat="Server">Description</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblDescription" Runat="Server"><%# Eval("medDescription")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtDescription" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblGenreColHeader" runat="Server">Genre</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblGenre" Runat="Server"><%# Eval("medGenre")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtGenre" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medMediaType" HeaderText="Media Type" SortExpression="medMediaType" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblMediaTypeColHeader" runat="Server">Media Type</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblMediaType" Runat="Server"><%# Eval("medMediaType")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtMediaType" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medDuration" HeaderText="Duration" SortExpression="medDuration" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblDurationColHeader" runat="Server">Duration</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblDuration" Runat="Server"><%# Eval("medDuration")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtDuration" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <%--<asp:BoundField DataField="medAlbum" HeaderText="Album" SortExpression="medAlbum" />--%>
                 <asp:TemplateField>
                  <HeaderTemplate>
                        <asp:Label ID="lblAlbumColHeader" runat="Server">Album</asp:Label>
                </HeaderTemplate>
                <ItemTemplate>                
                <asp:Label ID="lblAlbum" Runat="Server"><%# Eval("medAlbum")%></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAlbum" runat="server">
                    </asp:TextBox>                
                </FooterTemplate>                
            </asp:TemplateField>
                <asp:CommandField ShowDeleteButton="True" />
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
        
    </tr>
    </table>   
    
    
    <br />
    <br />
    <%--<table>
    <tr>
    <td>
     <asp:Label ID="lblUpload" runat="server" Text="Upload a file"></asp:Label>
    </td>
    <td><asp:FileUpload ID="fileUpload" runat="server" />
    </td>
    </tr>
    <tr><td></td></tr>
    <tr><td></td><td>
        <asp:Button ID="btnUpload" runat="server" Text="Upload" 
            onclick="btnUpload_Click" />
    </td><td></td></tr>
    </table>
    --%>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias" Where="medMediaType == @medMediaType" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlMediaTypes" Name="medMediaType" PropertyName="SelectedValue"
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
