﻿<%@ Page Language="C#" MasterPageFile="~/Media.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="MediaOnDemand.Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/site.js" type="text/javascript"></script>
    <script src="../js/playMedia.js" type="text/javascript"></script>
    <%--<title>Media On Demand</title> --%>
    <script type="text/javascript">
        function PlayMedia(link) {

            var mediaUrl = link.getAttribute('param');
            var mediaType = new String(link.getAttribute('mediaType'));

            mediaType = mediaType.trim();

            var url;

            if (mediaType == 'movie') {
                url = 'WatchMovies.aspx?playMedia=' + mediaUrl;
            }
            //                case 'movie':
            //                    url = '~/pages/WatchMovies.aspx?playMedia=' + mediaUrl;
            //                break;
            //                case 'music':
            //                    url = '~/pages/StreamMusic.aspx?playMedia=' + mediaUrl;
            //                break;
            //                case 'tv':
            //                    url = '~/pages/WatchTvSeries.aspx?=playMedia' + mediaUrl;
            //                break;
            //                case 'musicvideo':
            //                case 'sports':
            //                    url = '~/pages/OtherVideos.aspx?playMedia=' + mediaUrl;
            //                    break;
            //                default:
            //                    url = null;
            //                    break;
            //            }

            alert(url);

            if (url != null)
                window.location = url;
        }

        function ImageLoad(imageLocation) {

            alert(imageLocation);

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"><%= postBackStr %></script>
    <div class="main">
        <asp:SqlDataSource ID="dsLatestMediaPlayed" runat="server" SelectCommand="SELECT TOP (20) medId, medTitle, medPosterImageUrl, medLocation, medDateAdded, medIsViewable, medrating, medMediaType, medGenre FROM StoredMedia /*WHERE (medMediaType &lt;&gt; 'music')*/ ORDER BY medLastPlayedDate DESC"
            ConnectionString="<%$ ConnectionStrings:MediaOnDemandDBConnectionString %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsLatestMediaAdded" runat="server" SelectCommand="SELECT TOP (20) medId, medTitle, medPosterImageUrl, medLocation, medDateAdded, medIsViewable, medrating, medMediaType, medGenre FROM StoredMedia /*WHERE (medMediaType &lt;&gt; 'music')*/ ORDER BY medDateAdded DESC"
            ConnectionString="<%$ ConnectionStrings:MediaOnDemandDBConnectionString %>">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsHighestRatedMedia" runat="server" SelectCommand="SELECT TOP (20) medId, medTitle, medPosterImageUrl, medLocation, medDateAdded, medIsViewable, Rating, medMediaType, medGenre FROM StoredMedia JOIN (select rtgMediaId,AVG(rtgRating) as Rating from MediaRatings group by rtgMediaId) MediaRatings on StoredMedia.medId = MediaRatings.rtgMediaId order by Rating desc, medTitle asc"
            ConnectionString="<%$ ConnectionStrings:MediaOnDemandDBConnectionString %>">
        </asp:SqlDataSource>
        <br />
        <div>
            <asp:UpdatePanel ID="UpdatePanel" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="right" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnPreviousLatestMediaPlayed" ImageUrl="~/images/arrow-blue-rounded-left.jpg"
                                                Visible="false" runat="server" OnClick="btnPreviousLatestMediaPlayed_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPreviousLatestMediaPlayed" Text="Previous" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" style="width: 600px">
                                <h2>
                                    Latest Media Played</h2>
                                <asp:DataList ID="dlLatestMediaPlayed" DataKeyField="medId" RepeatDirection="Horizontal"
                                    RepeatColumns="5" runat="server" OnItemDataBound="dlLatestMediaPlayed_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Label ID="lblTitle" runat="server" Width="150px" Height="45px" Text='<%# Bind("medTitle") %>'></asp:Label>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a id="A1" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Image ID="imgPosterImage" OnLoad="imgPosterImage_Load" ImageUrl='<%# Bind("medPosterImageUrl") %>'
                                                            Width="158px" Height="216px" runat="server" />
                                                    </a>
                                                    <asp:Label ID="lblMissingImage" runat="server" Text="Please upload an image" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table>
                                                        <tr>
                                                        <td>
                                                        <asp:ImageButton ID="btnAddToPlaylist" CommandArgument='<%# Bind("medId") %>' Width="30px" Height="30px" ImageUrl="~/images/Buttons/addButton.jpg"
                                                            runat="server" OnClick="btnAddToPlaylist_Click"/>
                                                        </td>
                                                            <td>
                                                                <asp:Rating ID="ratingControl1" AutoPostBack="true" OnChanged="ratingControl1_Changed"
                                                                    OnPreRender="ratingControl1_PreRender" ReadOnly="true"
                                                                    MaxRating="5" StarCssClass="rating_star" FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty"
                                                                    WaitingStarCssClass="rating_empty" runat="server">
                                                                </asp:Rating>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Panel ID="ratingPanel1" OnPreRender="ratingPanel1_PreRender" runat="server">
                                                                    <asp:ImageButton ID="btnSubmitRating1" CommandArgument='<%# Bind("medId") %>'
                                                                        Text="Submit" runat="server" ImageUrl="~/images/rating/savebutton.png" />
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="dataListItem" />
                                </asp:DataList>
                            </td>
                            <td align="left" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnNextLatestMediaPlayed" ImageUrl="~/images/arrow-blue-rounded-right.jpg"
                                                runat="server" OnClick="btnNextLatestMediaPlayed_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNextLatestMediaPlayed" Text="Next" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnPreviousLatestMediaAdded" ImageUrl="~/images/arrow-blue-rounded-left.jpg"
                                                Visible="false" runat="server" OnClick="btnPreviousLatestMediaAdded_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPreviousLatestMediaAdded" Text="Previous" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" style="width: 600px">
                                <h2>
                                    Latest Media Added</h2>
                                <asp:DataList ID="dlLatestMediaAdded" DataKeyField="medId" RepeatDirection="Horizontal"
                                    RepeatColumns="5" runat="server" OnItemDataBound="dlLatestMediaAdded_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Label ID="lblTitle" runat="server" Width="150px" Height="45px" Text='<%# Bind("medTitle") %>'></asp:Label>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a id="A1" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Image ID="imgPosterImage" OnLoad="imgPosterImage_Load" ImageUrl='<%# Bind("medPosterImageUrl") %>'
                                                            Width="158px" Height="216px" runat="server" />
                                                    </a>
                                                    <asp:Label ID="lblMissingImage" runat="server" Text="Please upload an image" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table>
                                                        <tr>
                                                        <td>
                                                        <asp:ImageButton ID="btnAddToPlaylist" CommandArgument='<%# Bind("medId") %>' Width="30px" Height="30px" ImageUrl="~/images/Buttons/addButton.jpg"
                                                            runat="server" OnClick="btnAddToPlaylist_Click"/>
                                                        </td>
                                                            <td>
                                                                <asp:Rating ID="ratingControl2" AutoPostBack="true" OnChanged="ratingControl2_Changed"
                                                                    OnPreRender="ratingControl2_PreRender" ReadOnly="true"
                                                                    MaxRating="5" StarCssClass="rating_star" FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty"
                                                                    WaitingStarCssClass="rating_empty" runat="server">
                                                                </asp:Rating>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Panel ID="ratingPanel2" OnPreRender="ratingPanel2_PreRender" runat="server">
                                                                    <asp:ImageButton ID="btnSubmitRating2" CommandArgument='<%# Bind("medId") %>'
                                                                        Text="Submit" runat="server" ImageUrl="~/images/rating/savebutton.png" />
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="dataListItem" />
                                </asp:DataList>
                            </td>
                            <td align="left" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnNextLatestMediaAdded" ImageUrl="~/images/arrow-blue-rounded-right.jpg"
                                                runat="server" OnClick="btnNextLatestMediaAdded_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNextLatestMediaAdded" Text="Next" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnPreviousHighestRatedMedia" ImageUrl="~/images/arrow-blue-rounded-left.jpg"
                                                Visible="false" runat="server" OnClick="btnPreviousHighestRatedMedia_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblPreviousHighestRatedMedia" Text="Previous" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="center" style="width: 600px">
                                <h2>
                                    Highest Rated Media</h2>
                                <asp:DataList ID="dlHighestRatedMedia" DataKeyField="medId" RepeatDirection="Horizontal"
                                    RepeatColumns="5" runat="server" OnItemDataBound="dlHighestRatedMedia_ItemDataBound">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <a id="lnkVideoLink" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Label ID="lblTitle" runat="server" Width="150px" Height="45px" Text='<%# Bind("medTitle") %>'></asp:Label>
                                                    </a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a id="A1" href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("medTitle") %>'
                                                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                                                        <asp:Image ID="imgPosterImage" OnLoad="imgPosterImage_Load" ImageUrl='<%# Bind("medPosterImageUrl") %>'
                                                            Width="158px" Height="216px" runat="server" />
                                                    </a>
                                                    <asp:Label ID="lblMissingImage" runat="server" Text="Please upload an image" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table>
                                                        <tr>
                                                        <td>
                                                        <asp:ImageButton ID="btnAddToPlaylist" CommandArgument='<%# Bind("medId") %>' Width="30px" Height="30px" ImageUrl="~/images/Buttons/addButton.jpg"
                                                            runat="server" OnClick="btnAddToPlaylist_Click"/>
                                                        </td>
                                                            <td>
                                                                <asp:Rating ID="ratingControl3" AutoPostBack="true" OnChanged="ratingControl3_Changed"
                                                                    OnPreRender="ratingControl3_PreRender" ReadOnly="true"
                                                                    MaxRating="5" StarCssClass="rating_star" FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty"
                                                                    WaitingStarCssClass="rating_empty" runat="server">
                                                                </asp:Rating>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <asp:Panel ID="ratingPanel3" OnPreRender="ratingPanel3_PreRender" runat="server">
                                                                    <asp:ImageButton ID="btnSubmitRating3" CommandArgument='<%# Bind("medId") %>'
                                                                        Text="Submit" runat="server" ImageUrl="~/images/rating/savebutton.png" />
                                                                </asp:Panel>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle CssClass="dataListItem" />
                                </asp:DataList>
                            </td>
                            <td align="left" style="width: 100px">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="btnNextHighestRatedMedia" ImageUrl="~/images/arrow-blue-rounded-right.jpg"
                                                runat="server" OnClick="btnNextHighestRatedMedia_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblNextHighestRatedMedia" Text="Next" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div style="display: none">
        <asp:Button ID="btnSaveMediaPlayed" runat="server" OnClick="btnSaveMediaPlayed_Click" />
    </div>
    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaTitle" Value="" runat="server" />
</asp:Content>
