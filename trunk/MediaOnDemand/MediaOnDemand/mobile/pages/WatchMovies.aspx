<%@ Page Title="" Language="C#" MasterPageFile="~/mobile/MobileSite.Master" AutoEventWireup="true"
    CodeBehind="WatchMovies.aspx.cs" Inherits="MediaOnDemand.mobile.pages.WatchMovies" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../../js/jquery-1.6.2.min.js" type="text/javascript"></script>
    <link href="../Styles/flexscrollstyles.css" rel="stylesheet" type="text/css" />
    <script src="../js/flexcroll.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .flexcroll-hide-default
        {
            overflow: hidden !important;
        }
    </style>
    <style type="text/css">
        #mycustomscroll
        {
            /* Typical fixed height and fixed width example */ /*min-width: 2000px;*/
            width: 2500px;
            height: 250px;
            overflow: auto; /* IE overflow fix, position must be relative or absolute*/
            position: relative; /*background-color: #E7EADE;*/
            margin: 0.3em auto;
            padding: 15px;
            float: left;
            display: inline-block;
        }
        
        #horizontalwrap
        {
            border: 2px solid blue; /* this is only for show*/ /* Following is the way to stack things dynamically */
            display: inline;
            white-space: nowrap;
        }
    </style>
    <asp:Panel ID="panel" Width="100%" ScrollBars="Horizontal" runat="server">
        <div id="content">            
				
            <div id="mycustomscroll" class="flexcroll">
                <div id="horizontalwrap" style="border: 0">
                    <table>
                        <tr>
                            <td style="text-align: left">
                                <AjaxData:DataList ID="MediaDataList" ShowHeader="false" runat="server" DataKeyField="ID"
                                    CssClass="DataWebControlStyle" ItemDataBoundEvent="onItemDataBound" CellSpacing="20"
                                    RepeatDirection="Horizontal" RepeatColumns="20">
                                    <AlternatingItemStyle CssClass="AlternatingRowStyle" />
                                    <ItemStyle CssClass="RowStyle" />
                                    <HeaderStyle CssClass="HeaderStyle" />
                                    <FooterStyle CssClass="FooterStyle" />
                                    <HeaderTemplate>
                                        <div>
                                            Media Information
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table border="0">
                                            <tr>
                                                <td align="center" style="white-space: normal; vertical-align: middle; width: 250px;
                                                    height: 0px; display: none">
                                                    <h4>
                                                        <span id="mobMediaName"></span>
                                                    </h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="height: 200px; width: 220px; vertical-align: middle">
                                                    <a id="mobMediaLink" href="">
                                                        <img alt=" " id="mobPosterImage" width="180px" height="200px" src="" />
                                                    </a>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </AjaxData:DataList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </asp:Panel>
    <div style="margin-left: auto; margin-right: auto; width: 100%">
        <AjaxData:Pager ID="MediaPager" PageSize="10" runat="server" LastPageText="" FirstPageText=""
            CssClass="PagerRowStyle" CurrentPageStyle-CssClass="PagerCurrentPage" Font-Size="X-Large"
            OtherPageStyle-CssClass="PagerOtherPage" PageChangedEvent="pageChanged" NextPageText="Next"
            PreviousPageText="Previous" ShowNumeric="False" ShowPreviousAndNext="True">
        </AjaxData:Pager>
    </div>
    <script type="text/javascript" language="javascript">

        var _dataList;
        var _pager;

        function pageLoad(sender, e) {

            _dataList = $find('<%= MediaDataList.ClientID %>');
            _pager = $find('<%= MediaPager.ClientID %>');
            loadMedias();

            setTimeout(function () { window.scrollTo(0, 1); }, 1000);
        }

        function loadMedias() {

            var startIndex = (_pager.get_pageIndex() * _pager.get_pageSize());
            var endIndex = _pager.get_pageSize();

            MediaOnDemand.DataService.GetMediaListByMediaType('video', startIndex, endIndex, '', '', onMediaLoadSuccess);

        }

        function onMediaLoadSuccess(result) {
            _pager.set_recordCount(result.Total);
            _dataList.set_dataSource(result.Rows);
            _dataList.dataBind();
        }

        function onItemDataBound(sender, e) {
            var item = e.get_item();

            if (item.get_isDataItemType()) {
                var media = item.get_dataItem();

                var mobMediaName = item.findControl('mobMediaName');
                var mobPosterImage = item.findControl('mobPosterImage');
                var mobMediaLink = item.findControl('mobMediaLink');

                setText(mobMediaName, media.MediaTitle);
                setImageUrl(mobPosterImage, media.PosterImageUrl);
                setMediaUrl(mobMediaLink, media.FileName);

            }
        }

        function pageChanged(sender, e) {
            _pager.set_pageIndex(e.get_newPageIndex());
            loadMedias();
        }

        function setText(element, text) {
            if (typeof element.textContent != 'undefined') {
                element.textContent = text;
            }
            else if (typeof element.innerText != 'undefined') {
                element.innerText = text;
            }
        }

        function setImageUrl(element, url) {

            element.src = url;

        }

        function setMediaUrl(element, mediaFileName) {

            var mediaUrl;

            var queryString = '?';

            queryString += 'mediaType=video';

            queryString += '&';

            queryString += 'mediaTitle=' + mediaFileName;

            mediaUrl = 'Play.aspx' + queryString;

            element.href = mediaUrl;

        }
        
    </script>
</asp:Content>
