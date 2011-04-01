<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OtherVideos.aspx.cs"
    Inherits="MediaOnDemand.OtherVideos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/playMedia.js" type="text/javascript"></script>
    <script type="text/javascript">

        function showMediaInMainWindow() {

            if (_arrWin[0]) {

                var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');

                _arrWin[0] = null;

                var btnPlayInPopup = document.getElementById('btnPlayInPopup');

                if (btnPlayInPopup != null)
                    btnPlayInPopup.disabled = '';
            }
        }
    
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Videos</h1>
    <div id="fade" class="black_overlay">
        <div id="light" class="white_content">
            <center>
                <input type="button" value="Close video" onclick="closeVideo()" />
            </center>
            <div id="mediaPlayer">
            </div>
        </div>
    </div>
    
    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
    <center>
        <table width="60%" style="height: 20%">
            <tr>
                <td>
                    <asp:UpdatePanel ID="updatePanel" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td align="right" style="width: 50%">
                                        <asp:Label ID="lblChooseMediaType" runat="server" Visible="false" Text="Media category: "></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlMediaTypes" runat="server" Visible="false" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged"
                                            AutoPostBack="true" OnLoad="ddlMediaTypes_Load">                                            
                                            <asp:ListItem Value="sports" Selected="True">Sports</asp:ListItem>
                                            <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 50%">
                                        <asp:Label ID="lblChooseSeries" runat="server" Visible="false" Text="Series: "></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:DropDownList ID="ddlList" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="ddlList_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>                                
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </center>
    <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
        <ContentTemplate>
            <center>
                <table width="100%">
                    <tr>
                        <td id="PageSize" style="width: 75%">
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                            <asp:ListItem Selected="True">10</asp:ListItem>
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
                            <div class="mediaGrid">
                                <asp:GridView ID="gvVideos" Height="100%" Width="100%" PageSize="10" runat="server" AllowPaging="True"
                                    AllowSorting="True" AutoGenerateColumns="False" DataSourceID="lnqVideos" CellPadding="4"
                                    ForeColor="#333333" GridLines="None" ondatabound="gvVideos_DataBound">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                            <ItemTemplate>
                                                <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" param='<%# Eval("medLocation") %>'
                                                    mediaid='<%# Eval("medId") %>'>
                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="medArtist" HeaderText="Cast" ReadOnly="True" SortExpression="medArtist" />
                                        <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                            SortExpression="medDescription" />
                                        <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre" />
                                        <asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" SortExpression="medDuration" />
                                        <asp:BoundField DataField="medVideoType" HeaderText="Video Type" SortExpression="medVideoType" />
                                        <asp:BoundField DataField="medDateAdded" DataFormatString="{0:G}" HeaderText="Date Added">
                                            <HeaderStyle Font-Underline="True" />
                                        </asp:BoundField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <table cellspacing="0" cellpadding="4" border="0" id="ctl00_MainContent_gvMedia"
                                            style="color: #333333; border-collapse: collapse;" width="100%">
                                            <tr align="left" style="color: White; background-color: #284775;">
                                                <td colspan="12">
                                                </td>
                                            </tr>
                                            <tr style="color: White; background-color: #5D7B9D; font-weight: bold;">
                                                <th scope="col">
                                                    <a style="color: White;"><u>Title</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Cast</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Description</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Genre</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Duration</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Video Type</u></a>
                                                </th>
                                                <th scope="col">
                                                    <a style="color: White;"><u>Date Added</u></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td colspan="10">
                                                    <center>
                                                        No records found
                                                    </center>
                                                </td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                </asp:GridView>
                            </div>
                        </td>
                    </tr>
                </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="lnqVideos" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre, medAlbum, medDuration, medVideoType, medDateAdded, medMediaType, medId, medFileExt)"
        TableName="StoredMedias" Where="medMediaType == @medMediaType &amp;&amp; medGenre == @medGenre"
        OnSelected="lnqVideos_Selected">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlMediaTypes" Name="medMediaType" PropertyName="SelectedValue"
                Type="String" DefaultValue="sports" />
            <asp:ControlParameter ControlID="ddlList" Name="medGenre" PropertyName="SelectedValue"
                Type="String" DefaultValue=" " />
            
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnTotalRowCount" runat="server" />
    <asp:HiddenField ID="hdnMediaType" runat="server" />
    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
</asp:Content>
