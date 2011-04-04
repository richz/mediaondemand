<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs"
    Inherits="MediaOnDemand.Home" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div class="main">
        <br />
        <table width="90%">
            <tr>
                <td align="center">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <h2>
                                <asp:Label ID="lblLatestMedia" Text="Latest Media" runat="server"></asp:Label></h2>
                            <asp:DetailsView ID="dvLatestMedia" runat="server" Height="50px" Width="125px" DataSourceID="lnqLatestMedia"
                                EnableModelValidation="True" AutoGenerateRows="False" AllowPaging="True" CellPadding="4"
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                                <EditRowStyle BackColor="#999999" />
                                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                                <Fields>
                                    <asp:BoundField DataField="medId" HeaderText="medId" ReadOnly="True" SortExpression="medId"
                                        Visible="False" />
                                    <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                        <ItemTemplate>
                                            <%--<a id="lnkMediaLink" href="#" onclick="PlayMedia(this)" param='<%# Eval("medLocation") %>'
                                        mediatype='<%# Eval("medMediaType") %>'>--%>
                                            <asp:Label ID="lblTitle" Width="150px" runat="server" Text='<%# Bind("medTitle") %>'></asp:Label>
                                            <%--</a>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                        SortExpression="medDescription" />
                                    <asp:BoundField DataField="medArtist" HeaderText="Artist" ReadOnly="True" SortExpression="medArtist" />
                                    <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre" />                                    
                                    <asp:BoundField DataField="medLocation" HeaderText="Location" ReadOnly="True" SortExpression="medLocation"
                                        Visible="False" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgPosterImage" ImageUrl='<%# Bind("medPosterImageUrl") %>' Width="230px" Height="300px" runat="server" />
                                        </ItemTemplate>                                        
                                    </asp:TemplateField>
                                </Fields>
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerSettings FirstPageText="" LastPageText="" Mode="NextPrevious" NextPageImageUrl="~/images/arrow-blue-rounded-right.jpg"
                                    NextPageText="Next" PreviousPageImageUrl="~/images/arrow-blue-rounded-left.jpg"
                                    PreviousPageText="Previous" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            </asp:DetailsView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>
    <asp:LinqDataSource ID="lnqLatestMedia" runat="server" OnSelecting="lnqLatestMedia_Selecting">
    </asp:LinqDataSource>
</asp:Content>
