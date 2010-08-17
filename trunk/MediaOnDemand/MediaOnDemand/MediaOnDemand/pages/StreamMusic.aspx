<%@ Page Language="C#" MasterPageFile="~/LoggedIn.Master" AutoEventWireup="true"
    CodeBehind="StreamMusic.aspx.cs" Inherits="MediaOnDemand.StreamMusic" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/MediaPlayback/playMedia.js" type="text/javascript"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>

    <script src="../js/WebControls/PageGridView.js" type="text/javascript"></script>

    <link href="../styles/WebControls/MediaControls/VideoPlayers/FlashPlayer/FlowPlayer/FlowPlayerPlaylist.css"
        rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/MediaControls/VideoPlayers/FlashPlayer/FlowPlayer/flowplayer-3.2.2.min.js"></script>

    <script src="../js/MediaControls/VideoPlayers/FlashPlayer/FlowPlayer/flowplayer.playlist-3.0.8.js"
        type="text/javascript"></script>

    <script type="text/javascript" src="../js/VisualEffects/animatedcollapse.js">

        /***********************************************
        * Animated Collapsible DIV v2.4- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
        ***********************************************/

    </script>

    <script type="text/javascript">

        animatedcollapse.addDiv('collapsiblePlayerDiv', 'fade=1,height=30px')

        animatedcollapse.ontoggle = function($, divobj, state) { //fires each time a DIV is expanded/contracted
            //$: Access to jQuery
            //divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID
            //state: "block" or "none", depending on state
        }

        animatedcollapse.init()        

    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LeftColumn" runat="server">
    <div id="mediaPlaylist" class="hidden">
        <h2>
            Media Playlist
        </h2>
        <div id="playlist" class="clips petrol" style="float: left">
        </div>
        <input id="btnClearPlaylist" onclick="ClearPlaylist()" type="button" value="Clear" />
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Music</h1>
    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
    <table width="100%">
        <tr>
            <td>
                <table>
                    <tr>
                        <td align="right" style="width: 50%">
                            <asp:Label ID="lblArtist" runat="server" Text="Please choose an artist:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="artistUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlArtist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlArtist_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <center>
                   
                        <div id="mediaPlayer" class="visibleAudioPlayer">
                            <!-- this A tag is where your Flowplayer will be placed. it can be anywhere -->
                            <a id="player" style="display: block; width: 100%; height: 100%"></a>

                            <script type="text/javascript">

                                // install flowplayer into container
                                $f("player", "../usercontrols/MediaControls/VideoPlayers/FlashPlayer/FlowPlayer/flowplayer-3.2.2.swf", {

                                    // fullscreen button not needed here
                                    plugins: {
                                        controls: {
                                            
                                            height: 30,
                                            autoHide: false,
                                            playlist: true,
                                        },
                                        audio: {
                                        url: '../usercontrols/MediaControls/AudioPlayers/FlashPlayer/FlowPlayer/flowplayer.audio-3.2.0.swf'
                                        }
                                    }
                                });

                                $f("player").playlist("div.petrol", {

                                    // CSS class name of a playing entry
                                    playingClass: 'playing',

                                    // CSS class name of a paused entry
                                    pausedClass: 'paused',

                                    // CSS class name for an entry that is loading
                                    progressClass: 'progress',

                                    // if true, then each clip is advanced to the next clip when it ends
                                    loop: true,

                                    /*
                                    when set to true and the splash image is clicked, then the first clip is played.
                                    this has an effect on the manual configuration only
                                    */
                                    playOnClick: true
                                });
                                                            

                                
                            </script>

                        </div>
                    </div>
                </center>
            </td>
        </tr>
        <tr>
            <td>
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
                                    <center>
                                        <asp:GridView ID="gvMusic" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
                                            AutoGenerateColumns="False" CellPadding="4" DataSourceID="lnqMusic" EnableModelValidation="True"
                                            ForeColor="#333333" GridLines="None">
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Add to Playlist">
                                                    <ItemTemplate>
                                                        <a id="btnAddToPlaylist" type="button" onclick="AddToFlowPlayerPlaylist('<%# Eval("medLocation") %>', '<%# Eval("medTitle") %>')">
                                                            <img src="../images/Buttons/addButton.png" alt="Add to Playlist">
                                                        </a>
                                                    </ItemTemplate>
                                                    <HeaderStyle Font-Underline="True" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                                    <ItemTemplate>
                                                        <a id="lnkMusicLink" href="#" onclick="playMedia('<%# Eval("medLocation") %>','<%# Eval("medTitle") %>' ,'audio')">
                                                            <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                                                        </a>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="medArtist" HeaderText="Artist" ReadOnly="True" SortExpression="medArtist" />
                                                <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                                    SortExpression="medDescription" />
                                                <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre" />
                                                <asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" SortExpression="medDuration" />
                                                <asp:BoundField DataField="medAlbum" HeaderText="Album" ReadOnly="True" SortExpression="medAlbum" />
                                                <asp:BoundField DataField="medDateAdded" DataFormatString="{0:G}" HeaderText="Date Added">
                                                    <HeaderStyle Font-Underline="True" />
                                                    <ItemStyle Font-Underline="False" />
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
                                </td>
                            </tr>
                        </table>
                        </center> </td> </tr> </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:LinqDataSource ID="lnqMusic" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medArtist, medDescription, medGenre, medDuration, medAlbum, medId, medLocation, medIsViewable, medDateAdded, medMediaType)"
        TableName="StoredMedias" Where="medMediaType == @medMediaType &amp;&amp; medIsViewable == @medIsViewable &amp;&amp; medArtist == @medArtist"
        OnSelected="lnqMusic_Selected">
        <WhereParameters>
            <asp:Parameter DefaultValue="music" Name="medMediaType" Type="String" />
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
            <asp:ControlParameter ControlID="ddlArtist" Name="medArtist" PropertyName="SelectedValue"
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaTitle" Value="" runat="server" />
    <asp:HiddenField ID="hdnTotalRowCount" runat="server" />
</asp:Content>
