<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebsiteAdministration.aspx.cs" Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="LightBox" Namespace="LightBox" TagPrefix="lbn" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    <script type="text/javascript" src="../js/WebAdmin.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server">
    </asp:ToolkitScriptManager>
    <h1>
        Website Administration</h1>
    <table>
        <tr>
            <td>
                <asp:Label ID="lblChooseMediaType" runat="server" Text="Please choose a media type:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlMediaTypes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged">
                    <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>
                    <asp:ListItem Value="music">Music</asp:ListItem>
                    <asp:ListItem Value="othervideo">Other Videos</asp:ListItem>
                    <asp:ListItem Value="pictures">Pictures</asp:ListItem>
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
                            <asp:Button ID="btnApplyChanges" runat="server" Visible="false" Text="Apply changes" OnClick="btnApplyChanges_Click" />
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
                <div id="AddNewMediaPanel" runat="server">
                
                    <asp:Panel ID="popUpPanel" runat="server">
        <div>
            <center>
                <table>
                    <tr style="background-color: #5D7B9D; color: white;">
                        <td colspan="2" style="text-align: center;">
                            <asp:Label ID="lblHeader" runat="server" Text="Media Info"></asp:Label>
                        </td>
                    </tr>
                    <tr style="background-color: #F7F6F3; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblTitle" runat="server" Text="Title">
                            </asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: White; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: #F7F6F3; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblIsViewable" runat="server" Text="Is Viewable"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="ddlIsViewable" runat="server">
                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                <asp:ListItem Value="N">No</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="background-color: white; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblArtist" runat="server" Text="Artist"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtArtist" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: #F7F6F3; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: white; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblGenre" runat="server" Text="Genre"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: #F7F6F3; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblMediaType" runat="server" Text="Media Type"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:DropDownList ID="ddlMediaType" runat="server">
                                <asp:ListItem Value="movie">Movie</asp:ListItem>
                                <asp:ListItem Value="music">Music</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="background-color: white; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblDuration" runat="server" Text="Duration"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr style="background-color: #F7F6F3; color: #333333;">
                        <td style="text-align: right">
                            <asp:Label ID="lblAlbum" runat="server" Text="Album"></asp:Label>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="txtAlbum" runat="server"></asp:TextBox>
                        </td>
                        <tr>
                        <td colspan="2">
                            <asp:Label ID="lblMedId" Visible="false" runat="server" Text=""></asp:Label>                            
                        </td>
                        </tr>
                    </tr>
                </table>
            </center>
            <br />    
        </div>
    </asp:Panel>     
                </div>
            </td>
            <td></td>
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
                          <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Bind("medId") %>' runat="server" onclick="lnkEdit_Click">Edit</asp:LinkButton>
                      </ItemTemplate>
                      </asp:TemplateField>                        
                        <asp:BoundField DataField="medTitle" HeaderText="Title" 
                            SortExpression="medTitle" />
                        <asp:BoundField DataField="medLocation" HeaderText="Location" 
                            SortExpression="medLocation" />
                        <asp:BoundField DataField="medDescription" HeaderText="Description" 
                            SortExpression="medDescription" />
                        <asp:BoundField DataField="medIsViewable" HeaderText="IsViewable" 
                            SortExpression="medIsViewable" />
                        <asp:BoundField DataField="medDateAdded" HeaderText="DateAdded" 
                            SortExpression="medDateAdded" />
                        <asp:BoundField DataField="medArtist" HeaderText="Artist" 
                            SortExpression="medArtist" />
                        <asp:BoundField DataField="medGenre" HeaderText="Genre" 
                            SortExpression="medGenre" />
                        <asp:BoundField DataField="medMediaType" HeaderText="Media Type" 
                            SortExpression="medMediaType" />
                        <asp:BoundField DataField="medDuration" HeaderText="Duration" 
                            SortExpression="medDuration" />
                        <asp:BoundField DataField="medAlbum" HeaderText="Album" 
                            SortExpression="medAlbum" />
                        <asp:CommandField ShowDeleteButton="True" />
                        <asp:BoundField DataField="medId" HeaderText="Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="medId" />
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
                  <asp:Label id="lblFolderMessage" runat="server" ForeColor="Red"></asp:Label>
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
