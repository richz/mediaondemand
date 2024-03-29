﻿<%@ Page Language="C#" MasterPageFile="~/Media.Master" AutoEventWireup="true" CodeBehind="StreamMusic.aspx.cs"
    Inherits="MediaOnDemand.StreamMusic" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/site.js" type="text/javascript"></script>
    <script src="../js/playMedia.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 id="PageHeader">
        Music</h1>
    <script type="text/javascript"><%= postBackStr %></script>
    <%--<asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>--%>
    <center>
        <div id="musicPlayer">
        </div>
    </center>
    <%--    <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
        <ContentTemplate>--%>
    <table style="margin-left: auto; margin-right: auto">
        <tr>
            <td>
                <asp:Panel ID="findByRecordCountPanel" runat="server">
                    <table width="100%">
                        <tr>
                            <td align="center" colspan="2">
                                <table>
                                    <tr>
                                        <td align="center">
                                            <input style="display: none" type="button" id="btnPlayInPopup" onclick="showMediaInPopupWindow('music')"
                                                value="Play in popup" />
                                        </td>
                                        <td align="center">
                                            <input style="display: none" type="button" id="btnCloseMusicPlayer" onclick="CloseMusicPlayer()"
                                                value="Close Player" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <table>
                                    <tr>                                        
                                        <td>
                                            <asp:Label ID="lblArtist" Width="110px" runat="server" Text="Choose an artist:"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlArtist" runat="server" Visible="false" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlArtist_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTitle" Width="200px" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btnFilter" runat="server" Text="Search" OnClick="btnFilter_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="PageSize" align="right" style="width: 65%">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                                <%--<asp:ListItem Selected="True">10</asp:ListItem>--%>
                                                <asp:ListItem Selected="True">20</asp:ListItem>
                                                <asp:ListItem>50</asp:ListItem>
                                                <asp:ListItem>75</asp:ListItem>
                                                <asp:ListItem>100</asp:ListItem>
                                                <asp:ListItem Text="All" Value="all"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right">
                                            <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="mediaGrid">
                    <asp:Panel ID="gridViewPanel" Height="100%" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="gvMusic" Height="100%" Width="100%" runat="server" AllowPaging="True"
                            AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="lnqMusic"
                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" OnPageIndexChanged="gvMusic_PageIndexChanged"
                            PageSize="20">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField HeaderText="Add to Playlist" HeaderStyle-Font-Underline="true">
                                        <ItemTemplate>
                                            <%--<a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                <asp:Image ID="imgPlay" Width="30px" Height="30px" ImageUrl="~/images/play.jpg" runat="server" />
                                            </a>--%>
                                            <table width="100%">
                                                <tr>
                                                    <td align="center">
                                                        <asp:ImageButton ID="btnAddToPlaylist" CommandArgument='<%# Bind("medId") %>' ImageUrl="~/images/Buttons/addButton.jpg"
                                                            runat="server" OnClick="btnAddToPlaylist_Click"/>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <ItemStyle Width="100px" />
                                    </asp:TemplateField>
                                <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                    <ItemTemplate>
                                        <a id="lnkMovieLink" href="#" onclick="ForcePostBack(this, 'music')" mediatitle='<%# Eval("medTitle") %>'
                                            param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                            <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("medTitle") %>'></asp:Label>
                                        </a>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                            <ItemTemplate>
                                                <a onmouseover="ShowPosterImage(this)" onmouseout="tooltip.hide();" posterimageurl='<%# Eval("medPosterImageUrl") %>' href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("medTitle") %>'></asp:Label>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Average Rating" SortExpression="medRating">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>
                                                <asp:Panel ID="ratingPanel" Width="120px" OnPreRender="ratingPanel_PreRender" runat="server">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <asp:Rating ID="ratingControl" AutoPostBack="true" OnChanged="ratingControl_Changed"
                                                                    OnPreRender="ratingControl_PreRender" CurrentRating='<%# Bind("medRating") %>'
                                                                    MaxRating="5" StarCssClass="rating_star" FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty"
                                                                    WaitingStarCssClass="rating_empty" runat="server">
                                                                </asp:Rating>
                                                            </td>
                                                            <td>
                                                                <asp:ImageButton ID="btnSubmitRating" CommandArgument='<%# Bind("medId") %>' Text="Submit"
                                                                    runat="server" OnClick="Save_Rating" ImageUrl="~/images/rating/savebutton.png" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="150px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="medArtist" HeaderText="Artist" ReadOnly="True" SortExpression="medArtist">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                               <%-- <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                    SortExpression="medDescription">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--<asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" SortExpression="medDuration">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="medAlbum" HeaderText="Album" ReadOnly="True" SortExpression="medAlbum">
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="medDateAdded" DataFormatString="{0:G}" HeaderText="Date Added">
                                    <HeaderStyle Font-Underline="True" />
                                    <ItemStyle HorizontalAlign="Center" />
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
                                            <a style="color: White;"><u>Artist</u></a>
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
                                            <a style="color: White;"><u>Album</u></a>
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
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </asp:Panel>
                </div>
            </td>
        </tr>
    </table>
    <%-- </ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:LinqDataSource ID="lnqMusic" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medArtist, medDescription, medGenre, medDuration, medAlbum, medId, medLocation, medIsViewable, medDateAdded, medPosterImageUrl, medMediaType,medRating)"
        TableName="StoredMedias" Where="medMediaType == @medMediaType &amp;&amp; medIsViewable == @medIsViewable &amp;&amp; medArtist == @medArtist"
        OnSelected="lnqMusic_Selected">
    </asp:LinqDataSource>
    <div style="display: none">
        <asp:Button ID="btnSaveMediaPlayed" runat="server" OnClick="btnSaveMediaPlayed_Click" />
    </div>
    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
</asp:Content>
