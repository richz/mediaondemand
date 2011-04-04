<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebsiteAdministration.aspx.cs"
    Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register Assembly="MattBerseth.WebControls.AJAX" Namespace="MattBerseth.WebControls.AJAX.Progress"
    TagPrefix="mb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/WebAdmin.js" type="text/javascript"></script>
    <script src="../js/site.js" type="text/javascript"></script>
   
   
   <link rel="stylesheet" href="../../themes/base/jquery.ui.all.css">
	<script src="../../jquery-1.5.1.js"></script>
	<script src="../../ui/jquery.ui.core.js"></script>
	<script src="../../ui/jquery.ui.widget.js"></script>
	<script src="../../ui/jquery.ui.progressbar.js"></script>
   
   
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <style type="text/css">
        img.hide
        {
            visibility: hidden;
        }
        #progressbar.hide
        {
            visibility: hidden;
        }
        #lblProgressPercentage.hide
        {
            visibility: hidden;
        }
    </style>
    <script type="text/javascript">
        
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
    <script type="text/javascript">

        var progressPercent;

        $(document).ready(function () {

            $("#ctl00_MainContent_btnAddAllFromNetworkFolder").click(function () {

                progressPercent = 0;

                showProgress();

                var intervalID = setInterval(updateProgress, 93);
                $.ajax({
                    type: "POST",
                    url: "WebsiteAdministration.aspx/addFilesFromFolder",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (msg) {

                        clearInterval(intervalID);

                        document.body.removeChild(document.getElementById('lightBoxBackGround'));

                        ForcePostBack();
                    }
                });

                return false;
            });

            $("#ctl00_MainContent_btnDeleteAllFromNetworkFolder").click(function () {

                var response = confirm("Are you sure you want to delete all records for this type?");
                if (response == true) {

                    progressPercent = 0;

                    showProgress();

                    var intervalID = setInterval(updateProgress, 1);
                    $.ajax({
                        type: "POST",
                        url: "WebsiteAdministration.aspx/deleteAllRecordsForType",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: true,
                        success: function (msg) {

                            clearInterval(intervalID);

                            document.body.removeChild(document.getElementById('lightBoxBackGround'));

                            ForcePostBack();
                        }
                    });
                }
                return false;
            });

            $("#ctl00_MainContent_btnDeleteAllRecords").click(function () {

                var response = confirm("Are you sure you want to delete all the records?");
                if (response == true) {

                    progressPercent = 0;

                    showProgress();

                    var intervalID = setInterval(updateProgress, 1);
                    $.ajax({
                        type: "POST",
                        url: "WebsiteAdministration.aspx/deleteAllMediaRecords",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: true,
                        success: function (msg) {

                            clearInterval(intervalID);

                            document.body.removeChild(document.getElementById('lightBoxBackGround'));

                            ForcePostBack();
                        }
                    });
                }

                return false;
            });

            $("#ctl00_MainContent_btnSyncRecordsWithMediaFiles").click(function () {

                var response = confirm("Are you sure you want to sync all the records?\nFiles will be deleted and re-added.");
                if (response == true) {

                    progressbar = 0;

                    showProgress();

                    var intervalID = setInterval(updateProgress, 1);
                    $.ajax({
                        type: "POST",
                        url: "WebsiteAdministration.aspx/syncAllMediaRecords",
                        data: "{}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        async: true,
                        success: function (msg) {

                            clearInterval(intervalID);

                            document.body.removeChild(document.getElementById('lightBoxBackGround'));

                            ForcePostBack();
                        }
                    });
                }

                return false;
            });

            function updateProgress(filesToProcess) {

//                progressPercent += 1;

//                $("#progressbar").progressbar({
//                    value: progressPercent
//                });

//                

//                var percentLabel = document.getElementById('ctl00_MainContent_lblProgressPercent');
//                percentLabel.value = progressPercent + ' %';

            }

        });

    </script>

    <style type="text/css">
	.ui-progressbar-value { background-image: url('../images/ui-bg_diagonals-thick_15_0b3e6f_40x40.png'); }
	</style>
	<script>
	    $(function () {
	        $("#progressbar").progressbar({
	            value: 0
	        });
	    });
	</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"><%= postBackStr %></script>
    <h1>
        Media Administration</h1>
    <br />
    <br />
    <br />
    <table width="100%">
        <tr>
            <td style="width: 75%" class="alignLeft" colspan="3">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblChooseMediaType" runat="server" Text="Please choose a media type:"
                                OnDataBinding="ddlMediaTypes_SelectedIndexChanged"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMediaTypes" runat="server" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged"
                                AutoPostBack="true">
                                <%--<asp:ListItem Value="all">All</asp:ListItem>--%>
                                <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>
                                <asp:ListItem Value="tv">TV</asp:ListItem>
                                <asp:ListItem Value="sports">Sports</asp:ListItem>
                                <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>
                                <asp:ListItem Value="music">Music</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="alignLeft" style="width:25%">
                <asp:Button ID="btnAddAllFromNetworkFolder" Width="200px" runat="server" Text="Add all media of selected type" />
            </td>
            <td align="center">
                <asp:Button ID="btnSyncRecordsWithMediaFiles" Visible="false" runat="server" Text="Sync Records with MediaFiles"/>
            </td>
            <td class="alignRight"  style="width:25%">
                <asp:Button ID="btnDeleteAllFromNetworkFolder" Width="210px" runat="server" Text="Delete all media of selected type" />
            </td>
        </tr>
        <tr>
            <td class="alignLeft">
                <asp:Button ID="btnAddNewMediaRow" Width="110px" runat="server" Text="Add new media" OnClick="btnAddNewMediaRow_Click" />
            </td>
            <td class="alignRight" colspan="2">
                <asp:Button ID="btnDeleteAllRecords" Width="120px" runat="server" Text="Delete all records" />
            </td>
        </tr>
        <tr style="width: 1000px">
            <td id="PageSize" class="alignLeft" colspan="2">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem>50</asp:ListItem>
                                <asp:ListItem Value="all">All</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="alignRight">
                <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <%--<tr>
        <td colspan="3" align="center">
        <div id="progressbar" style="width:500px"></div>
        <asp:Label ID="lblProgressPercent" runat="server" Text=""></asp:Label>    
        </td>
        
        </tr>--%>
    </table>
    <div class="mediaGrid">
        <asp:Panel ID="gridViewPanel" CssClass="gridViewPanel" Height="100%" runat="server" ScrollBars="Auto">
            <asp:GridView ID="gvMedia" runat="server" Width="100%" Height="100%" AutoGenerateColumns="False"
                DataSourceID="lnqMedia" PagerSettings-Position="TopAndBottom" EnableModelValidation="True"
                DataKeyNames="medId" CellPadding="4" ForeColor="#333333" PagerSettings-Mode="NumericFirstLast"
                GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gvMedia_SelectedIndexChanged"
                OnDataBound="gvMedia_DataBound">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" CausesValidation="False" OnClientClick="return confirm('Are you sure you want to delete this record?');"
                                CommandName="Delete" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Bind("medId") %>'
                                OnClick="lnkEdit_Click">Edit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="medTitle" HeaderText="Title" SortExpression="medTitle" />
                    <%--<asp:BoundField DataField="medLocation" HeaderText="Location" SortExpression="medLocation" />--%>
                    <asp:BoundField DataField="medDescription" HeaderText="Description" SortExpression="medDescription" />
                    <asp:BoundField DataField="medIsViewable" HeaderText="Is Viewable" SortExpression="medIsViewable" />
                    <asp:BoundField DataField="medDateAdded" HeaderText="Date Added" SortExpression="medDateAdded"
                        Visible="False" />
                    <asp:BoundField DataField="medArtist" HeaderText="Artist" SortExpression="medArtist" />
                    <asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />
                    <asp:BoundField DataField="medMediaType" HeaderText="Media Type" SortExpression="medMediaType" />
                    <asp:BoundField DataField="medDuration" HeaderText="Duration" SortExpression="medDuration" />
                    <asp:BoundField DataField="medAlbum" HeaderText="Album" SortExpression="medAlbum" />
                    <asp:BoundField DataField="medFileExt" HeaderText="File Type" SortExpression="medFileExt" />
                </Columns>
                <EditRowStyle BackColor="#FFFFFF" />
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
                                <a style="color: White;"><u>Location</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Description</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Is Viewable</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Artist</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Genre</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Media Type</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Duration</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>Album</u></a>
                            </th>
                            <th scope="col">
                                <a style="color: White;"><u>File Type</u></a>
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
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" Wrap="True" />
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="False" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
        </asp:Panel>
    </div>
    <div style="visibility: hidden">
        <asp:Button ID="btnApplyChanges" Visible="true" runat="server" Text="" OnClick="btnApplyChanges_Click" />
    </div>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias" Where="medMediaType == @medMediaType" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True" OnSelected="lnqMedia_Selected">
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
    <asp:HiddenField ID="hdnFileExt" runat="server" />
    <asp:HiddenField ID="hdnVideoType" runat="server" />
    <asp:HiddenField ID="hdnPosterImageUrl" runat="server" />
    <asp:HiddenField ID="hdnUpdateMode" runat="server" />
    <asp:HiddenField ID="hdnNetworkFolder" runat="server" />
</asp:Content>
