<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Media.aspx.cs" Inherits="MediaOnDemand.Media" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/playMedia.js"></script>
    
    <style type="text/css">
        .gridPager td
        {
            padding-left: 20px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
      
    <script type="text/javascript"><%= postBackStr %></script>

    <asp:GridView ID="gvMedia" runat="server"
        CssClass="table table-hover table-striped" GridLines="None"
        AutoGenerateColumns="False" DataKeyNames="medId" DataSourceID="MediaSQLDataSource" AllowPaging="True" AllowSorting="True" OnSorted="gvMedia_Sorted" PageSize="15">
        <Columns>            
            <asp:TemplateField HeaderText="Title" SortExpression="medTitle">              
                <ItemTemplate>
                    <a id="lnkMediaLink" <%--onmouseover="ShowPosterImage(this)" onmouseout="tooltip.hide();"--%> posterimageurl='<%# Eval("medPosterImageUrl") %>'
                        href="#" onclick="ForcePostBack(this)" mediatitle='<%# Eval("medTitle") %>'
                        param='<%# Eval("medLocation") %>' mediaid='<%# Eval("medId") %>'>
                        <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("medTitle") %>'></asp:Label>
                    </a>                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="medLocation" HeaderText="medLocation" SortExpression="medLocation" Visible="False" />
            <asp:BoundField DataField="medDateAdded" HeaderText="medDateAdded" SortExpression="medDateAdded" Visible="False" />
            <asp:BoundField DataField="medIsViewable" HeaderText="medIsViewable" SortExpression="medIsViewable" Visible="False" />
            <asp:BoundField DataField="medArtist" HeaderText="Artist" SortExpression="medArtist" Visible="False" />
            <asp:BoundField DataField="medDescription" HeaderText="medDescription" SortExpression="medDescription" Visible="False" />
            <asp:BoundField DataField="medId" HeaderText="medId" InsertVisible="False" ReadOnly="True" SortExpression="medId" Visible="False" />
            <asp:BoundField DataField="medGenre" HeaderText="Genre" SortExpression="medGenre" />
            <asp:BoundField DataField="medMediaType" HeaderText="medMediaType" SortExpression="medMediaType" Visible="False" />
            <asp:BoundField DataField="medDuration" HeaderText="medDuration" SortExpression="medDuration" Visible="False" />
            <asp:BoundField DataField="medAlbum" HeaderText="medAlbum" SortExpression="medAlbum" Visible="False" />
            <asp:BoundField DataField="medVideoType" HeaderText="medVideoType" SortExpression="medVideoType" Visible="False" />
            <asp:BoundField DataField="medFileExt" HeaderText="medFileExt" SortExpression="medFileExt" Visible="False" />
            <asp:BoundField DataField="medPosterImageUrl" HeaderText="medPosterImageUrl" SortExpression="medPosterImageUrl" Visible="False" />
            <asp:BoundField DataField="medLastPlayedDate" HeaderText="medLastPlayedDate" SortExpression="medLastPlayedDate" Visible="False" />
            <asp:BoundField DataField="medRating" HeaderText="medRating" SortExpression="medRating" Visible="False" />
        </Columns>
        <PagerSettings PageButtonCount="15" FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PreviousPageText="Previous" />
        <PagerStyle Width="200px" CssClass="gridPager" BorderStyle="None" Font-Bold="True" Font-Overline="False" Font-Size="Large" Font-Underline="False" HorizontalAlign="Center" Wrap="True" />
        <RowStyle CssClass="cursor-pointer" />
    </asp:GridView>

    <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />
    <asp:HiddenField ID="hdnMediaTitle" Value="" runat="server" />

    <asp:SqlDataSource ID="MediaSQLDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:MEDIAONDEMANDDBConnectionString %>" SelectCommand="SELECT medTitle, medLocation, medDateAdded, medIsViewable, medArtist, medDescription, medId, medGenre, medMediaType, medDuration, medAlbum, medVideoType, medFileExt, medPosterImageUrl, medLastPlayedDate, medRating FROM StoredMedia where medIsViewable = 'Y'" OnSelecting="MediaSQLDataSource_Selecting" OnFiltering="MediaSQLDataSource_Filtering" OnSelected="MediaSQLDataSource_Selected">
        <SelectParameters>
            <%--<asp:QueryStringParameter Name="mediaType" QueryStringField="mediaType" />
            <asp:QueryStringParameter Name="mediaGenre" QueryStringField="mediaGenre" ConvertEmptyStringToNull="true" />--%>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
