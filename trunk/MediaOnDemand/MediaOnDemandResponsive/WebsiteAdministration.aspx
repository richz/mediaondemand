<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebsiteAdministration.aspx.cs"
    Inherits="MediaOnDemand.WebsiteAdministration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/WebAdmin.js" type="text/javascript"></script>
    <script src="js/site.js" type="text/javascript"></script>
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
    
        type="text/javascript"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("div[id=lightBoxBackGround]").click(function () {
                CloseLightBox();
            });

            $("input[id$=btnAddAllFromNetworkFolder]").click(function () {

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

            $("input[id$=btnDeleteAllFromNetworkFolder]").click(function () {

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

            $("input[id$=btnDeleteAllRecords]").click(function () {

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

        function deleteStoredMedia(link) {

            var res = confirm('Are you sure you want to delete this record?');

            if (res) {
                var mediaId = $('#' + link.id).attr('mediaid');

                $('input[id$=hdnSingleMediaToDelete]').val(mediaId);

                //eval($('a[id$=lnkDeleteLink][mediaid=' + mediaId + ']').attr('href'));
            }

            return false;
        }
        
    </script>

    <style>
        table[id*=rblMediaType] td {
            padding-left: 5px!important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <script type="text/javascript"><%= postBackStr %></script>
    <h1 id="PageHeader">
        Media Administration</h1>
    <br />
    <table style="margin-left: auto; margin-right: auto; width: 100%;">
        <tr>
            <td colspan="2">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100%">
                            <asp:Label ID="lblImageMediaType" runat="server" Text="Select a media type "></asp:Label>
                        </td>
                        </tr>
        <tr>
                        <td class="rblMediaType">
                            <asp:RadioButtonList ID="rblMediaType" CellPadding="20" CellSpacing="50" RepeatDirection="Horizontal"
                                runat="server" OnSelectedIndexChanged="rblMediaType_SelectedIndexChanged" AutoPostBack="True">
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
                        </td>     </tr>
        <tr>
                        <td style="width:400px">
                            <asp:FileUpload ID="ImageUpload" CssClass="btn btn-lg btn-default" Width="100%" runat="server" />
                            <asp:Button ID="btnUploadFile" CssClass="btn btn-lg btn-default" Width="100%" runat="server" Text="Upload file" OnClick="btnUploadFile_Click" />
                        </td>     </tr>
        <tr>
                        <td align="left">
                            <asp:Label ID="lblImageUploadStatus" runat="server" ForeColor="Green" Text=""></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
        <tr>
            <td class="alignLeft">
                <asp:Button ID="btnAddAllFromNetworkFolder" CssClass="btn btn-lg btn-default" Width="100%" runat="server" Text="Add records of selected media type" />
            </td></tr>
        <tr>
            <td class="alignRight">
                <asp:Button ID="btnDeleteAllFromNetworkFolder" Enabled="false" CssClass="btn btn-lg btn-default" Width="100%" runat="server" Text="Delete records of selected media type" />
            </td>
        </tr>
        <tr>
            <td class="alignLeft">
                <asp:Button ID="btnAddNewMediaRow" runat="server" CssClass="btn btn-lg btn-default" Width="100%" Text="Add new media" OnClick="btnAddNewMediaRow_Click" />
            </td>
            </tr>
        <tr>
            <td class="alignRight">
                <asp:Button ID="btnDeleteAllRecords" Enabled="false" runat="server" CssClass="btn btn-lg btn-default" Width="100%" Text="Delete all records" />
            </td>
        </tr>
        <tr>
            <%-- <td align="left" style="width: 400px">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblMediaType" runat="server" Text="Media Type: "></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlMediaTypes" runat="server" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged"
                                AutoPostBack="true">
                                
                                <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>
                                <asp:ListItem Value="tv">TV</asp:ListItem>
                                <asp:ListItem Value="sports">Sports</asp:ListItem>
                                <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>
                                <asp:ListItem Value="music">Music</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>--%>
            <td align="left">
                <br />
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblFindByTitle" runat="server" Text="Find by Title"></asp:Label>
                        </td>
                        <td style="width: 400px; padding-left: 15px">
                        
                            <asp:TextBox ID="txtTitle" Width="100%" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button ID="btnFilter"  CssClass="btn btn-lg btn-default" runat="server" Text="Filter" OnClick="btnFilter_Click" />
                        </td>
                    </tr>
                </table>
            </td>
            <td colspan="1" class="alignRight">
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
            <asp:GridView ID="gvMedia" CssClass="table table-hover table-striped" GridLines="None" runat="server" Width="100%" Height="100%" AutoGenerateColumns="False"
                DataSourceID="lnqMedia" PagerSettings-Position="TopAndBottom"
                DataKeyNames="medId" CellPadding="4" ForeColor="#333333" PagerSettings-Mode="NumericFirstLast"
                AllowPaging="True" AllowSorting="True" OnDataBound="gvMedia_DataBound">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <%--<a id="lnkDelete" style="text-decoration:underline; color:blue; cursor:pointer" onclick="deleteStoredMedia(this)" mediaid='<%# Eval("medId") %>'>Delete</a>--%>
                            <asp:LinkButton ID="lnkDeleteLink" mediaid='<%# Eval("medId") %>' style="display:block" OnClientClick="deleteStoredMedia(this)" runat="server" CausesValidation="False" 
                                OnClick="lnkDelete_Click" Text="Delete"></asp:LinkButton>
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
                <%--<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />--%>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Left" Wrap="True" />
                <PagerSettings Mode="NumericFirstLast" Position="TopAndBottom" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="False" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />

                <PagerSettings PageButtonCount="15" FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        <PagerStyle Width="200px" CssClass="gridPager" BorderStyle="None" Font-Bold="True" Font-Overline="False" Font-Size="Large" Font-Underline="False" HorizontalAlign="Center" Wrap="True" />
        <RowStyle CssClass="cursor-pointer" />

            </asp:GridView>
        </asp:Panel>
    </div>
    <div style="visibility: hidden">
        <asp:Button ID="btnApplyChanges" Visible="true" runat="server" Text="" OnClick="btnApplyChanges_Click" />
    </div>
    <asp:LinqDataSource ID="lnqMedia" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        TableName="StoredMedias" Where="medMediaType == @medMediaType" EnableDelete="True"
        EnableInsert="True" EnableUpdate="True" OnSelected="lnqMedia_Selected" OnDeleted="lnqMedia_Deleted" OnDeleting="lnqMedia_Deleting">
        <WhereParameters>
            <asp:ControlParameter ControlID="rblMediaType" Name="medMediaType" PropertyName="SelectedValue"
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
    <asp:HiddenField ID="hdnSingleMediaToDelete" runat="server" />
</asp:Content>
