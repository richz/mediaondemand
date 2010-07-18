<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchMovies.aspx.cs"
    Inherits="MediaOnDemand.WatchMovies" %>

<%@ Register Assembly="ASPNetVideo.NET3" Namespace="ASPNetVideo" TagPrefix="ASPNetVideo" %>
<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/playMedia.js" type="text/javascript"></script>

    <script type="text/javascript">

       
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Movies</h1>

    <script type="text/javascript"><%= postBackStr %></script>

    <center>
        <table width="75%" style="height: 100%">
            <tr style="height: 20px">
                <td colspan="2">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Text=""></asp:Label>
                </td>
            </tr>
            <tr style="height: 20px">
                <td align="right" style="width: 50%">
                    <asp:Label ID="lblGenre" runat="server" Text="Please choose a genre:"></asp:Label>
                </td>
                <td align="left">
                    <asp:UpdatePanel ID="genreUpdatePanel" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged">
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td>
                    <input type="button" id="btnPlayInPopup" value="Show In Popup Window" onclick="showMediaInPopupWindow()" />
                </td>
            </tr>
        </table>
        <div id="mediaPlayer">
        </div>
    </center>
    <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
        <ContentTemplate>
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
                        <asp:GridView ID="gvMovies" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" DataSourceID="lnqMovies" CellPadding="4" ForeColor="#333333"
                            GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                    <ItemTemplate>
                                        <a id="lnkMovieLink" href="#" onclick="ForcePostBack(this, 'video')" param='<%# Eval("medLocation") %>' mediaId='<%# Eval("medId") %>'>
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
                                <asp:BoundField DataField="medDateAdded" DataFormatString="{0:G}" HeaderText="Date Added"
                                    SortExpression="medDateAdded">
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
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="lnqMovies" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre, medDuration, medVideoType, medDateAdded, medId, medMediaType, medFileExt)"
        TableName="StoredMedias" Where="medIsViewable == @medIsViewable &amp;&amp; medMediaType == @medMediaType &amp;&amp; medGenre == @medGenre"
        OnSelected="lnqMovies_Selected">
        <WhereParameters>
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
            <asp:Parameter DefaultValue="movie" Name="medMediaType" Type="String" />
            <asp:ControlParameter ControlID="ddlGenre" DefaultValue="Comedy" Name="medGenre"
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
</asp:Content>
