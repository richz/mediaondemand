<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebsiteAdministration.aspx.cs"
    Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script src="../js/WebAdmin.js" type="text/javascript"></script>
    <script src="../js/site.js" type="text/javascript"></script>
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

        $(document).ready(function () {

            $("#ctl00_MainContent_btnAddAllFromNetworkFolder").click(function () {

                showProgress();

                var intervalID = setInterval(updateProgress, 93);
                $.ajax({
                    type: "POST",
                    url: "WebsiteAdministration.aspx/addFilesForMediaType",
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
                    showProgress();

                    var intervalID = setInterval(updateProgress, 1);
                    $.ajax({
                        type: "POST",
                        url: "WebsiteAdministration.aspx/deleteAllRecordsForMediaType",
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

            function updateProgress(filesToProcess) {

                // Not used right now
            }

        });

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript"><%= postBackStr %></script>
    <h1 id="PageHeader">
        Media Administration</h1>
        <br />
    <table style="margin-left: auto; margin-right: auto; width: 1150px;">
    <tr>
    <td colspan="2">
    <table>
    <tr>
    <td>
        <asp:Label ID="lblImageMediaType" runat="server" Text="Select a media type "></asp:Label>
    </td>
    <td>
        <asp:RadioButtonList ID="rblMediaType" CellSpacing="10" RepeatDirection="Horizontal" 
            runat="server" onselectedindexchanged="rblMediaType_SelectedIndexChanged" 
            AutoPostBack="True">
        <asp:ListItem Text="Movie" Value="movie" Selected="True"></asp:ListItem>
        <asp:ListItem Text="TV" Value="tv"></asp:ListItem>
        <asp:ListItem Text="Music Videos" Value="musicvideo"></asp:ListItem>
        <asp:ListItem Text="Music" Value="music"></asp:ListItem>
        <asp:ListItem Text="Sports" Value="sports"></asp:ListItem>
        </asp:RadioButtonList>
    </td>
    </tr>
    <tr>
    <td>
        <asp:Label ID="lblImageUpload" runat="server" Text="Upload an image "></asp:Label>
    </td>
    <td>
    <asp:FileUpload ID="ImageUpload" runat="server" />
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center">
        <asp:Button ID="btnUploadFile" runat="server" Text="Upload file" 
            onclick="btnUploadFile_Click" />
    </td>
    </tr>
    <tr>
    <td colspan="2" align="center">
        <asp:Label ID="lblImageUploadStatus" runat="server" ForeColor="Green" Text=""></asp:Label>
    </td>
    </tr>
    </table>
    

    <br />
    
    </td>
    </tr>    
        <tr>
            <td class="alignLeft">
                <asp:Button ID="btnAddAllFromNetworkFolder" runat="server" Text="Add all records of selected media type" />
            </td>
            <td class="alignRight">
                <asp:Button ID="btnDeleteAllFromNetworkFolder" runat="server" Text="Delete all records of selected media type" />
            </td>
        </tr>
        <tr>
            <td class="alignLeft">
                <asp:Button ID="btnAddNewMediaRow" runat="server" Text="Add new media" OnClick="btnAddNewMediaRow_Click" />
            </td>
            <td class="alignRight">
                <asp:Button ID="btnDeleteAllRecords" runat="server" Text="Delete all records" />
            </td>
        </tr>
        <tr>
            <td align="left" style="width: 400px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblMediaType" runat="server" Text="Media Type: "></asp:Label>
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
            <td colspan class="alignRight">
                <table style="float: right">
                    <tr>
                        <td>
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
                                    <td>
                                        <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <div class="mediaGrid">
        <asp:Panel ID="gridViewPanel" CssClass="gridViewPanel" runat="server" ScrollBars="Auto">
            <asp:GridView ID="gvMedia" runat="server" Width="100%" Height="100%" AutoGenerateColumns="False"
                DataSourceID="lnqMedia" PagerSettings-Position="TopAndBottom" EnableModelValidation="True"
                DataKeyNames="medId" CellPadding="4" ForeColor="#333333" PagerSettings-Mode="NumericFirstLast"
                GridLines="None" AllowPaging="True" AllowSorting="True" OnDataBound="gvMedia_DataBound">
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
    <asp:HiddenField ID="hdnImageUploadPath" runat="server" />
</asp:Content>
