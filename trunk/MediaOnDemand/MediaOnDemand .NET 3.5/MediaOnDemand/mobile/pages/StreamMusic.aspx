<%@ Page Title="" Language="C#" MasterPageFile="~/mobile/MobileSite.Master" AutoEventWireup="true" CodeBehind="StreamMusic.aspx.cs" Inherits="MediaOnDemand.mobile.pages.StreamMusic" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<script language="javascript" type="text/javascript">

    function pageLoad(sender, e) {

        setTimeout(function () { window.scrollTo(0, 1); }, 1000);
    }

</script>


<div id="main">
           
        <div class="MediaList">
            <asp:DetailsView ID="dvMobileMedia" runat="server" AutoGenerateRows="False" DataKeyNames="mobId"
                DataSourceID="dsMobileMedia" EnableModelValidation="True" Height="50px" Width="100%"
                AllowPaging="True">
                <Fields>
                    <asp:BoundField DataField="mobMediaTitle" HeaderText="Title" SortExpression="mobMediaTitle" />
                    <asp:BoundField DataField="mobMediaFileExt" HeaderText="mobMediaFileExt" SortExpression="mobMediaFileExt"
                        Visible="False" />
                    <asp:BoundField DataField="mobMediaType" HeaderText="mobMediaType" SortExpression="mobMediaType"
                        Visible="False" />
                    <asp:BoundField DataField="mobId" HeaderText="mobId" InsertVisible="False" ReadOnly="True"
                        SortExpression="mobId" Visible="False" />
                    <asp:BoundField DataField="mobDateAdded" HeaderText="mobDateAdded" SortExpression="mobDateAdded"
                        Visible="False" />
                    <asp:BoundField DataField="mobIsViewable" HeaderText="mobIsViewable" SortExpression="mobIsViewable"
                        Visible="False" />
                    <asp:BoundField DataField="mobArtist" HeaderText="mobArtist" SortExpression="mobArtist"
                        Visible="False" />
                    <asp:BoundField DataField="mobDescription" HeaderText="mobDescription" SortExpression="mobDescription"
                        Visible="False" />
                    <asp:BoundField DataField="mobGenre" HeaderText="mobGenre" SortExpression="mobGenre"
                        Visible="False" />
                    <asp:BoundField DataField="mobAlbum" HeaderText="mobAlbum" SortExpression="mobAlbum"
                        Visible="False" />
                    <asp:BoundField DataField="mobPosterImageUrl" HeaderText="mobPosterImageUrl" SortExpression="mobPosterImageUrl"
                        Visible="False" />
                    <asp:BoundField DataField="mobLastPlayedDate" HeaderText="mobLastPlayedDate" SortExpression="mobLastPlayedDate"
                        Visible="False" />
                    
                    <asp:TemplateField HeaderText="Rating" SortExpression="mobRating">
                        <ItemTemplate>
                            <asp:Rating ID="ratingControl" AutoPostBack="true" ReadOnly="true" CurrentRating='<%# Bind("mobRating") %>'
                                MaxRating="5" StarCssClass="rating_star" FilledStarCssClass="rating_filled" EmptyStarCssClass="rating_empty"
                                WaitingStarCssClass="rating_empty" runat="server">
                            </asp:Rating>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="mobFileName" HeaderText="mobFileName" SortExpression="mobFileName"
                        Visible="False" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="imgPosterImage" ImageUrl='<%# Bind("mobPosterImageUrl") %>'
                                Width="158px" Height="216px" CommandArgument='<%# Bind("mobFileName") %>' runat="server"
                                OnClick="imgPosterImage_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/images/Buttons/nextButton.png"
                    PreviousPageImageUrl="~/images/Buttons/previousButton.png" NextPageText="Next"
                    Position="Top" PreviousPageText="Previous" />
                <PagerStyle HorizontalAlign="Center" />
           </asp:DetailsView>            
        </div>
    </div>
    <asp:LinqDataSource ID="dsMobileMedia" runat="server" OrderBy="mobMediaTitle" ContextTypeName="MediaOnDemand.MobileMediaDataContext"
        TableName="MobileMedias" Where='mobMediaType == "audio"'>        
    </asp:LinqDataSource>    
</asp:Content>
