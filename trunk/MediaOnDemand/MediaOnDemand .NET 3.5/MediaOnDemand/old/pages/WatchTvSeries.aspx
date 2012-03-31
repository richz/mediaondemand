<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchTvSeries.aspx.cs"
    Inherits="MediaOnDemand.WatchTvSeries" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/site.js" type="text/javascript"></script>
    <script src="../js/playMedia.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 id="PageHeader">
        Television</h1>
    <div id="fade" class="black_overlay">
        <div id="light" class="white_content">
            <center>
                <input type="button" value="Close video" onclick="closeVideo()" />
            </center>
            <div id="mediaPlayer">
            </div>
        </div>
    </div>
    <table width="60%" style="height: 20%">
        <tr>
            <td>
                <asp:UpdatePanel ID="updatePanel" runat="server">
                    <ContentTemplate>
                        <table>
                            <tr>
                                <td align="right" style="width: 50%">
                                    <asp:Label ID="lblChooseSeries" runat="server" Visible="false" Text="Series: "></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlList" runat="server" Visible="false" AutoPostBack="true"
                                        OnSelectedIndexChanged="ddlList_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 50%">
                                    <asp:Label ID="lblChooseSeason" runat="server" Visible="false" Text="Season: "></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="ddlSeasonNumbers" runat="server" Visible="false" AutoPostBack="true">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
        <ContentTemplate>
            <center>
                <table width="100%">
                    <tr>
                        <td align="right">
                            <asp:Panel ID="findByRecordCountPanel" runat="server">
                                <table>
                                    <tr>
                                        <td id="PageSize" style="width: 75%">
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
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="mediaGrid">
                                <asp:Panel ID="gridViewPanel" Height="100%" runat="server" ScrollBars="Auto">
                                    <asp:GridView ID="gvVideos" Height="100%" Width="100%" PageSize="20" runat="server"
                                        AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="lnqVideos"
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Image ID="imgPlay" Width="30px" Height="30px" ImageUrl="~/images/play.jpg" runat="server" />
                                                    </a>
                                                    <%--<a id="lnkPlayMedia" onclick="PlayMedia(this)" href="#" param='<%# Eval("medLocation") %>'>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                                            </a>--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="medTitle" HeaderText="Title" ReadOnly="True" 
                                            SortExpression="medTitle" >
                                        <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                            --%>
                                            <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                                <ItemTemplate>
                                                    <a onmouseover="ShowPosterImage(this)" onmouseout="tooltip.hide();" posterimageurl='<%# Eval("medPosterImageUrl") %>'
                                                        href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("medTitle") %>'></asp:Label>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Rating" SortExpression="medRating">
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
                                            <asp:BoundField DataField="medArtist" HeaderText="Cast" ReadOnly="True" SortExpression="medArtist">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                                SortExpression="medDescription">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" SortExpression="medDuration">
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="medVideoType" HeaderText="Video Type" SortExpression="medVideoType">
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
                                </asp:Panel>
                            </div>
                        </td>
                    </tr>
                </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
<asp:LinqDataSource ID="lnqVideos" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre,
medAlbum, medDuration, medVideoType, medDateAdded, medPosterImageUrl, medMediaType,
medId, medFileExt, medRating)" TableName="StoredMedias" Where="medMediaType == @medMediaType
&amp;&amp; medGenre == @medGenre &amp;&amp; medAlbum == @medAlbum" OnSelected="lnqVideos_Selected">
<WhereParameters> <asp:Parameter Name="medMediaType" DefaultValue="tv" Type="String"
/> <asp:ControlParameter ControlID="ddlList" Name="medAlbum" PropertyName="SelectedValue"
Type="String" DefaultValue=" " /> <asp:ControlParameter ControlID="ddlSeasonNumbers"
Name="medGenre" PropertyName="SelectedValue" Type="String" DefaultValue=" " /> </WhereParameters>
</asp:LinqDataSource> 

 <div style="display:none">
    <asp:Button ID="btnSaveMediaPlayed" runat="server" 
            onclick="btnSaveMediaPlayed_Click" />
    </div>

<asp:HiddenField ID="hdnTotalRowCount" runat="server" /> 
<asp:HiddenField ID="hdnMediaType" runat="server" /> 
<asp:HiddenField ID="hdnMediaUrl" Value="" runat="server"/> 
<asp:HiddenField ID="hdnMediaId" Value="" runat="server" /> 
<asp:HiddenField ID="hdnMediaTitle" Value="" runat="server"/> 
</asp:Content> 