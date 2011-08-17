<%@ Page Title="" Language="C#" MasterPageFile="~/mobile/MobileSite.Master" AutoEventWireup="true"
    CodeBehind="WatchMovies.aspx.cs" Inherits="MediaOnDemand.mobile.pages.WatchMovies" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/mobile.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
        <asp:Button ID="btnAddAllMedia" runat="server" Visible="false" Text="Add All Media"
            OnClick="btnAddAllMedia_Click" />
        <asp:HiddenField ID="hdnMediaType" runat="server" />
        <asp:DropDownList ID="ddlMediaType" Font-Size="Larger" Width="100%" Height="50px"
            AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlMediaType_SelectedIndexChanged">
            <asp:ListItem Text="Video" Value="video" Selected="True"></asp:ListItem>
            <asp:ListItem Text="Audio" Value="audio"></asp:ListItem>
        </asp:DropDownList>
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
                    <%--<asp:BoundField DataField="mobRating" HeaderText="Rating" SortExpression="mobRating" />--%>
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
            <%--
            <asp:DataList ID="dlMobileMedia" Width="100%" DataKeyField="mobId" RepeatDirection="Vertical"
                DataSourceID="dsMobileMedia" RepeatColumns="1" runat="server">
                <ItemTemplate>
                    <table id="mediaTable">
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblTitle" Width="100%" runat="server" Text='<%# Bind("mobMediaTitle") %>'></asp:Label>
                                
                            </td>
                            
                        </tr>
                        <tr>
                            <td align="center">
                                
                                <asp:ImageButton ID="imgPosterImage" ImageUrl='<%# Bind("mobPosterImageUrl") %>'
                                    Width="158px" Height="216px" CommandArgument='<%# Bind("mobFileName") %>' runat="server"
                                    OnClick="imgPosterImage_Click" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <ItemStyle CssClass="dataListItem" />
            </asp:DataList>--%>
        </div>
    </div>
    <asp:LinqDataSource ID="dsMobileMedia" runat="server" ContextTypeName="MediaOnDemand.mobile.pages.MobileMediaDataContext"
        TableName="MobileMedias" Where="mobMediaType == @mobMediaType">
        <WhereParameters>
            <asp:ControlParameter ControlID="ddlMediaType" DefaultValue="video" Name="mobMediaType"
                PropertyName="SelectedValue" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <%--<asp:ControlParameter ControlID="rblMediaType" Name="medMediaType" PropertyName="SelectedValue"
                Type="String" />--%>
    <%--
    <asp:SqlDataSource ID="dsMobileMedia" runat="server"
        
        ConnectionString="<%$ ConnectionStrings:MediaOnDemandDBConnectionString %>" 
        SelectCommand="SELECT * FROM [MobileMedia]" FilterExpression="it.mobMediaType = @MediaType">
        <FilterParameters><asp:ControlParameter Name="MediaType" ControlID="ddlMediaType" PropertyName="SelectedValue" DefaultValue="video" /></FilterParameters>
        </asp:SqlDataSource>--%>
</asp:Content>
