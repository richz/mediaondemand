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

    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
        rel="stylesheet" type="text/css" />

    <style type="text/css">
    
    img.hide
    {
    	visibility:hidden;
    }
    
    #progressbar.hide
    {
    	visibility:hidden;
    }    
    
    #lblProgressPercentage.hide
    {
    	visibility:hidden;
    }
    
    </style>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>

    <script type="text/javascript">

        $(document).ready(function() {

            $("#progressbar").progressbar({ value: 0 });

            $("#progressbar").addClass('hide');
            //$("#lblProgressPercentage").addClass('hide');

            $('img').addClass('hide');

            $("#ctl00_MainContent_btnAddAllFromNetworkFolder").click(function() {

                $("#progressbar").removeClass('hide');
                $("#lblProgressPercentage").removeClass('hide');

                var hdnProcessType = document.getElementById('ctl00_MainContent_hdnProcessType');
                hdnProcessType.setAttribute('value', 'add');

                var filesToProcess = document.getElementById('ctl00_MainContent_hdnFilesToProcess').value;

                var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
                var height = document.documentElement.scrollHeight;
                var layer = document.createElement('div');
                layer.style.zIndex = 2;
                layer.id = 'lightBoxBackGround';
                layer.style.position = 'absolute';
                layer.style.top = '0px';
                layer.style.left = '0px';
                layer.style.height = height + 'px';
                layer.style.width = width + 'px';
                layer.style.backgroundColor = 'black';
                layer.style.opacity = '.1';
                layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");

                document.body.appendChild(layer);

                //$('img').removeClass('hide');

                var intervalID = setInterval(updateProgress, 93);
                $.ajax({
                    type: "POST",
                    url: "WebsiteAdministration.aspx/addFilesFromFolder",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function(msg) {
                    $("#progressbar").progressbar("value", 100);

                    var lblProgressPercentage = document.getElementById('ctl00_MainContent_lblProgressPercentage');

                    if (navigator.appName == 'Netscape')
                        lblProgressPercentage.textContent = '';
                    else
                        lblProgressPercentage.innerText = '';

                        $("#result").text(msg.d);
                        clearInterval(intervalID);

                        //$('img').addClass('hide');

                        $("#progressbar").addClass('hide');
                        $("#lblProgressPercentage").addClass('hide');

                        document.body.removeChild(document.getElementById('lightBoxBackGround'));

                        ForcePostBack();
                    }
                });

                return false;
            });

            $("#ctl00_MainContent_btnDeleteAllRecords").click(function() {

                $("#progressbar").removeClass('hide');
                $("#lblProgressPercentage").removeClass('hide');

                var hdnProcessType = document.getElementById('ctl00_MainContent_hdnProcessType');
                hdnProcessType.setAttribute('value', 'del');

                var filesToProcess = document.getElementById('ctl00_MainContent_hdnFilesToProcess').value;

                var width = document.documentElement.clientWidth + document.documentElement.scrollLeft;
                var height = document.documentElement.scrollHeight;
                var layer = document.createElement('div');
                layer.style.zIndex = 2;
                layer.id = 'lightBoxBackGround';
                layer.style.position = 'absolute';
                layer.style.top = '0px';
                layer.style.left = '0px';
                layer.style.height = height + 'px';
                layer.style.width = width + 'px';
                layer.style.backgroundColor = 'black';
                layer.style.opacity = '.1';
                layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");

                document.body.appendChild(layer);

                //$('img').removeClass('hide');

                var intervalID = setInterval(updateProgress, 1);
                $.ajax({
                    type: "POST",
                    url: "WebsiteAdministration.aspx/deleteAllRecordsForType",
                    data: "{}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function(msg) {
                        $("#progressbar").progressbar("value", 100);

                        var lblProgressPercentage = document.getElementById('ctl00_MainContent_lblProgressPercentage');

                        if (navigator.appName == 'Netscape')
                            lblProgressPercentage.textContent = '';
                        else
                            lblProgressPercentage.innerText = '';

                        //$("#result").text(msg.d);
                        clearInterval(intervalID);

                        //$('img').addClass('hide');

                        $("#lblProgressPercentage").addClass('hide');
                        $("#progressbar").addClass('hide');

                        document.body.removeChild(document.getElementById('lightBoxBackGround'));

                        ForcePostBack();
                    }
                });

                return false;
            });

            function updateProgress(filesToProcess) {

                var filesToProcess = document.getElementById('ctl00_MainContent_hdnFilesToProcess').value;

                var oldPercentage = $("#progressbar").progressbar("value");

                var increment;

                if (document.getElementById('ctl00_MainContent_hdnProcessType' == 'add'))
                    increment = 100 / filesToProcess;
                else
                    increment = 425 / filesToProcess;

                $("#progressbar").progressbar("value", oldPercentage + increment);

                var updatedPercentage = $("#progressbar").progressbar("value");

                var lblProgressPercentage = document.getElementById('ctl00_MainContent_lblProgressPercentage');

                if (navigator.appName == 'Netscape')
                    lblProgressPercentage.textContent = updatedPercentage.toFixed(0) + '%';
                else
                    lblProgressPercentage.innerText = updatedPercentage.toFixed(0) + '%';

            }

        });
   
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript"><%= postBackStr %></script>

    <h1>
        Website Administration</h1>
    <br />
    <br />
    <br />
    <center>
        <table width="80%">
            <tr>
                <td id="Td1" style="width: 75%" align="left" colspan="2">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblChooseMediaType" runat="server" Text="Please choose a media type:"
                                    OnDataBinding="ddlMediaTypes_SelectedIndexChanged"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMediaTypes" runat="server" OnSelectedIndexChanged="ddlMediaTypes_SelectedIndexChanged"
                                    AutoPostBack="true">
                                    <asp:ListItem Value="movie" Selected="True">Movies</asp:ListItem>
                                    <asp:ListItem Value="tv">TV</asp:ListItem>
                                    <asp:ListItem Value="basketball">Basketball</asp:ListItem>
                                    <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>
                                    <asp:ListItem Value="music">Music</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="btnAddAllFromNetworkFolder" runat="server" Text="Add all files from folder" />
                </td>
                <td align="left">
                    <asp:Button ID="btnDeleteAllRecords" runat="server" Text="Delete All Records" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:Button ID="btnAddNewMediaRow" runat="server" Text="Add new media" OnClick="btnAddNewMediaRow_Click" />
                </td>
            </tr>
        </table>
        
        <table>
        <tr>
        <td>
        <div id="progressbar" style="z-index:3; border-style:double; background-color:White; width:400px; height:20px">
        </div>
        </td>       
        <td>        
            <asp:Label ID="lblProgressPercentage" runat="server" Text="">
            </asp:Label>
        </td>
        </tr>
        </table>
        
        
        
        <%--<div id="ProgressIndicator" style="z-index:3;">
        
        <img id="progressImg" alt="Progress" style="z-index:4" src="../images/ajax-loaderCircle.gif"/>
        </div>--%>
        <table>
            <tr>
                <td id="PageSize" align="left">
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
                <td align="left">
                    <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div style="text-align: center">
                        <asp:GridView ID="gvMedia" runat="server" AutoGenerateColumns="False" DataSourceID="lnqMedia"
                            EnableModelValidation="True" DataKeyNames="medId" CellPadding="4" ForeColor="#333333"
                            GridLines="None" AllowPaging="True" AllowSorting="True">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEdit" CommandArgument='<%# Bind("medId") %>' runat="server"
                                            OnClick="lnkEdit_Click">Edit</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="medTitle" HeaderText="Title" SortExpression="medTitle" />
                                <asp:BoundField DataField="medLocation" HeaderText="Location" 
                                    SortExpression="medLocation" >
                                    <HeaderStyle Width="50px" />
                                    <ItemStyle Width="50px" />
                                    <ControlStyle Width="50px"/>
                                </asp:BoundField>
                                <asp:BoundField DataField="medDescription" HeaderText="Description" SortExpression="medDescription" />
                                <asp:BoundField DataField="medIsViewable" HeaderText="Is Viewable" SortExpression="medIsViewable" />
                                <asp:BoundField DataField="medDateAdded" HeaderText="Date Added" 
                                    SortExpression="medDateAdded" Visible="False" />
                                <asp:BoundField DataField="medArtist" HeaderText="Artist" 
                                    SortExpression="medArtist" />
                                <asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />
                                <asp:BoundField DataField="medMediaType" HeaderText="Media Type" SortExpression="medMediaType" />
                                <asp:BoundField DataField="medDuration" HeaderText="Duration" 
                                    SortExpression="medDuration" />
                                <asp:BoundField DataField="medAlbum" HeaderText="Album" 
                                    SortExpression="medAlbum" />
                                <asp:BoundField DataField="medFileExt" HeaderText="File Type" SortExpression="medFileExt" />
                                <asp:CommandField ShowDeleteButton="True" />
                                
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <EmptyDataTemplate>
                                <center>
                                    <asp:Label ID="lblNoRecsFound" runat="server" Text=""></asp:Label>
                                </center>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" Wrap="True" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Wrap="False" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </div>
                </td>
            </tr>
        </table>
    </center>
    
    <div style="visibility:hidden">
    <asp:Button ID="btnApplyChanges" Visible="true" runat="server" Text="" 
        onclick="btnApplyChanges_Click" />
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
    <asp:HiddenField ID="hdnUpdateMode" runat="server" />
    <asp:HiddenField ID="hdnNetworkFolder" runat="server" />
    
    <asp:HiddenField ID="hdnFilesToProcess" runat="server" />
    <asp:HiddenField ID="hdnProcessType" runat="server" />
</asp:Content>
