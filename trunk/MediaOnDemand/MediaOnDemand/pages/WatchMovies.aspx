<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchMovies.aspx.cs"
    Inherits="MediaOnDemand.WatchMovies" Culture="auto" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/playMedia.js" type="text/javascript"></script>

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="../js/animatedcollapse.js">

        /***********************************************
        * Animated Collapsible DIV v2.4- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
        * This notice MUST stay intact for legal use
        * Visit Dynamic Drive at http://www.dynamicdrive.com/ for this script and 100s more
        ***********************************************/

    </script>
    
    <script type="text/javascript">

        animatedcollapse.addDiv('collapsiblePlayerDiv', 'fade=1,height=400px')
        
        animatedcollapse.ontoggle = function($, divobj, state) { //fires each time a DIV is expanded/contracted
            //$: Access to jQuery
            //divobj: DOM reference to DIV being expanded/ collapsed. Use "divobj.id" to get its ID
            //state: "block" or "none", depending on state
        }

        animatedcollapse.init()

</script>

    <!-- 
		include flowplayer JavaScript file that does  
		Flash embedding and provides the Flowplayer API.
	-->

    <script src="../js/PageGridView.js" type="text/javascript"></script>

    <link href="../Styles/FlowPlayerPlaylist.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../js/swf flash player/flowplayer-3.2.2.min.js"></script>

    <script src="../js/flowplayer.playlist-3.0.8.js" type="text/javascript"></script>

    <!-- some minimal styling, can be removed -->
    <%--    <link rel="stylesheet" type="text/css" href="../Styles/style.css" />
--%>

    <script type="text/javascript">
       
       
    </script>

</asp:Content>
<asp:Content ContentPlaceHolderID="LeftColumn" runat="server">
    
    
    <div id="mediaPlaylist" class="hidden">
    
    <h2>
    Media Playlist
    </h2>
    
    <div id="playlist" class="clips petrol" style="float: left">
    </div>
    <input id="btnClearPlaylist" onclick="ClearPlaylist()" type="button"
        value="Clear" />
        
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Movies</h1>

    <script type="text/javascript"><%= postBackStr %></script>

    <table width="100%">
        <tr>
            <td>
                <table width="75%" style="height: 100%">
                    <tr style="height: 20px">
                        <td colspan="2">
                            <asp:Label ID="lblMessage" runat="server" Font-Bold="True"></asp:Label>
                        </td>
                    </tr>
                    <tr style="height: 20px">
                        <td align="right" style="width: 50%">
                            <asp:Label ID="lblGenre" runat="server" Text="Please choose a genre:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="genreUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlGenre" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlGenre_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
            
                <center>
     
 <a href="javascript:animatedcollapse.show('collapsiblePlayerDiv')">Show player</a> || <a href="javascript:animatedcollapse.hide('collapsiblePlayerDiv')">Hide player</a>

<div id="collapsiblePlayerDiv" style="display:none">

                    <div id="mediaPlayer" class="visibleMediaPlayer">
                        <!-- this A tag is where your Flowplayer will be placed. it can be anywhere -->
                        <a id="player" style="display: block; width: 100%; height: 100%"></a>

                        <script type="text/javascript">

                            flowplayer("player", "../UserControls/flv flash player/flowplayer-3.2.2.swf", {

                                // show playlist buttons in controlbar
                                plugins: {
                                    controls: {
                                        playlist: true,
                                        // use tube skin with a different background color
                                        url: '../UserControls/flv flash player/flowplayer.controls-3.2.1.swf'

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
                                    <asp:Label ID="lblRecordCount" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:GridView ID="gvMovies" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
                                        AutoGenerateColumns="False" DataSourceID="lnqMovies" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" OnSelectedIndexChanged="gvMovies_SelectedIndexChanged" OnDataBound="gvMovies_DataBound">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="Add to Playlist">
                                                <ItemTemplate>
                                                    <a id="btnAddToPlaylist" type="button" onclick="AddToFlowPlayerPlaylist('<%# Eval("medLocation") %>', '<%# Eval("medTitle") %>')">
                                                        <img src="../images/addButton.png" alt="Add to Playlist">
                                                    </a>
                                                </ItemTemplate>
                                                <HeaderStyle Font-Underline="True" />
                                            </asp:TemplateField>
                                            <%--
                                            <asp:TemplateField>
                                                <ItemTemplate>                                                
                                                    <asp:CheckBox ID="cbMediaSelector" CommandArgument='<%# Eval("medId") %>' onclick="GridViewMediaSelector_Click" runat="server"/>
                                                    
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <%--<asp:BoundField DataField="medId" HeaderText="Media Id"/>--%>
                                            <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                                <ItemTemplate>
                                                    <a id="lnkMovieLink" href="#" onclick="ForcePostBack('<%# Eval("medLocation") %>','<%# Eval("medTitle") %>' ,'video', this, '<%# Eval("medId") %>')">
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
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <asp:LinqDataSource ID="lnqMovies" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre, medDuration, medVideoType, medDateAdded, medId, medMediaType, medFileExt)"
        TableName="StoredMedias" Where="medIsViewable == @medIsViewable &amp;&amp; medMediaType == @medMediaType &amp;&amp; medGenre == @medGenre &amp;&amp; medFileExt == @medFileExt"
        OnSelected="lnqMovies_Selected">
        <WhereParameters>
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
            <asp:Parameter DefaultValue="movie" Name="medMediaType" Type="String" />
            <asp:Parameter DefaultValue=".flv" Name="medFileExt" />
            <asp:ControlParameter ControlID="ddlGenre" DefaultValue="Comedy" Name="medGenre"
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaUrl" runat="server" />
    <asp:HiddenField ID="hdnMediaId" runat="server" />
    <asp:HiddenField ID="hdnMediaTitle" runat="server" />
    <asp:HiddenField ID="hdnSelectedMedia" runat="server" />
    <asp:HiddenField ID="isPopupOpen" runat="server" />
    <asp:HiddenField ID="hdnTotalRowCount" runat="server" />
</asp:Content>
<asp:Content ContentPlaceHolderID="RightColumn" runat="server">
</asp:Content>
