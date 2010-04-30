﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OtherVideos.aspx.cs" Inherits="MediaOnDemand.OtherVideos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/playMedia.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Other Videos</h1>   

<form id="watchVideosForm">
<script type="text/javascript"><%= postBackStr %></script>

    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>

    <center>
    <table width="400px" style="height:300px">
<tr>
<td align="right" style="width:45%">
 <asp:Label ID="lblChooseMediaType" runat="server" 
                    Text="Please choose a media type:" 
                    ondatabinding="ddlMediaTypes_SelectedIndexChanged"></asp:Label>
</td>
<td align="left">
    <asp:UpdatePanel ID="updatePanel" runat="server">
    <ContentTemplate>
    <asp:DropDownList ID="ddlMediaTypes" runat="server" 
            onselectedindexchanged="ddlMediaTypes_SelectedIndexChanged" AutoPostBack="true">                            
                    <asp:ListItem Value="tv" Selected="True">TV</asp:ListItem>                    
                    <asp:ListItem Value="basketball">Basketball</asp:ListItem>
                    <asp:ListItem Value="documentary">Documentaries</asp:ListItem>
                    <asp:ListItem Value="musicvideo">Music Videos</asp:ListItem>                                                                     
        </asp:DropDownList>
    </ContentTemplate>
    </asp:UpdatePanel>

    
</td>
</tr>
<tr>
<td colspan="2">
</td>
</tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="true" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
               
                <cc1:Media_Player_Control ID="wmPlayer" Height="300px" Width="100%" AutoStart="true"
                    runat="server" />             
                                    
                <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
                
            </td>
        </tr>
    </table>
    </center>
    
    <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
        <ContentTemplate>
        <center>
            <table>
                <tr>
                    <td id="PageSize" style="width: 75%">
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
                                        <asp:ListItem Value="all" Selected="True">All</asp:ListItem>
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
                        <asp:GridView ID="gvVideos" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
                            AutoGenerateColumns="False" DataSourceID="lnqVideos" CellPadding="4" ForeColor="#333333"
                            GridLines="None" OnDataBound="gvMovies_DataBound" OnRowDataBound="gvMovies_RowDataBound">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                
                                    <ItemTemplate>   
                                              <a id="lnkMovieLink" href="#" onclick="ForcePostBack(this)" param='<%# Eval("medLocation") %>'>
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
                                <asp:BoundField DataField="medVideoType" HeaderText="Video Type" 
                                    SortExpression="medVideoType" />
                            </Columns>
                            <EmptyDataTemplate>
                                <center>
                                    <asp:Label ID="lblNoRecsFound" runat="server" Text="No records found"></asp:Label>
                                </center>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            </center>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinqDataSource ID="lnqVideos" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre, medDuration, medVideoType)"
        TableName="StoredMedias" Where="medIsViewable == @medIsViewable">
        <WhereParameters>
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:HiddenField ID="hdnMediaType" runat="server" />
    </form>

</asp:Content>