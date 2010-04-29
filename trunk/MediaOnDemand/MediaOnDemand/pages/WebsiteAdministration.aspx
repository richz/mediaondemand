<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebsiteAdministration.aspx.cs" Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<%@ Register src="../WebControls/PageSizeSelector.ascx" tagname="PageSizeSelector" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <script src="../js/WebAdmin.js" type="text/javascript"></script>

    <style type="text/css">
        .style1
        {
            width: 184px;
        }
        .style2
        {
            width: 578px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
    </asp:ToolkitScriptManager>--%>
   
    <h1>Website Administration</h1>    
    <table>
    <tr>
 <td>
                <asp:Label ID="lblChooseMediaType" runat="server" 
                    Text="Please choose a media type:" 
                    ondatabinding="ddlMediaTypes_SelectedIndexChanged"></asp:Label>
            </td>
    <td>
        <asp:DropDownList ID="ddlMediaTypes" runat="server" 
            onselectedindexchanged="ddlMediaTypes_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>                    
                    <asp:ListItem Value="tv">TV</asp:ListItem>                    
                    <asp:ListItem Value="basketball">Basketball</asp:ListItem>
                    <asp:ListItem Value="documentary">Documentaries</asp:ListItem>
                    <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>                   
                    <asp:ListItem Value="music">Music</asp:ListItem>                    
        </asp:DropDownList>
    </td>
    </tr>      
    </table>
    <br />
    <br />
    <table>
    <tr>
    <td class="style2">
    <table>
    <tr>
    <td colspan="2"><asp:Button ID="btnAddAllFromNetworkFolder" runat="server" 
            Text="Add all files from network folder" 
            onclick="btnAddAllFromNetworkFolder_Click" /> 
    </td>
    <td><asp:Button ID="btnDeleteAllRecords" runat="server" Text="Delete All Records" 
            onclick="btnDeleteAllRecords_Click" />
    </td>
    </tr>
    </table>           
    </td>  
    
    </tr>
        <tr>
            <td colspan="2">                        
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
        
        <td colspan="2" align="center">
        
        <asp:UpdatePanel ID="upFolderStatus" runat="server">
        <ContentTemplate>
        <asp:Label ID="lblFolderMessage" runat="server" ForeColor="Red"></asp:Label>
        </ContentTemplate>
    </asp:UpdatePanel>       
        
        </td>        
        </tr>
        <tr>
                
        <td id="PageSize" style="width:75%">
        <table>
        <tr>
        <td>
            <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
        </td>
        <td>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlPageSize_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem Value="all">All</asp:ListItem>
            </asp:DropDownList>
        </td>
        </tr>
        </table>
        </td>        
            <td align="right">            
               <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
            </td>          
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="gvMedia" runat="server" AutoGenerateColumns="False" DataSourceID="lnqMedia"
                    EnableModelValidation="True" DataKeyNames="medId" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AllowPaging="True" AllowSorting="True" 
                    onpageindexchanged="gvMedia_PageIndexChanged" 
                    onpageindexchanging="gvMedia_PageIndexChanging" 
                    onrowdeleted="gvMedia_RowDeleted" onrowdeleting="gvMedia_RowDeleting">
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
                        <asp:BoundField DataField="medIsViewable" HeaderText="Is Viewable" 
                            SortExpression="medIsViewable" />
                        <asp:BoundField DataField="medDateAdded" HeaderText="Date Added" 
                            SortExpression="medDateAdded" />
                        <asp:BoundField DataField="medArtist" HeaderText="Artist" SortExpression="medArtist" />
                        <asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />
                        <asp:BoundField DataField="medMediaType" HeaderText="Media Type" SortExpression="medMediaType" />
                        <asp:BoundField DataField="medDuration" HeaderText="Duration" SortExpression="medDuration" />
                        <asp:BoundField DataField="medAlbum" HeaderText="Album" SortExpression="medAlbum" />
                        <asp:BoundField DataField="medVideoType" HeaderText="Video Type" SortExpression="medVideoType" />
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
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" 
                        Wrap="True" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="False"/>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
            
        </tr>
    </table>
    <br />
    <br />
    
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias" Where="medMediaType == @medMediaType" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlMediaTypes" Name="medMediaType" PropertyName="SelectedValue"
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
        
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
    <asp:HiddenField ID="hdnNetworkFolder" runat="server" />
    
</asp:Content>
