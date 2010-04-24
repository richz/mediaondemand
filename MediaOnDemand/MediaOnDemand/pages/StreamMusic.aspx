<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StreamMusic.aspx.cs" Inherits="MediaOnDemand.StreamMusic" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Listen to Music</title>
    <script src="../Scripts/mediaplayer.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
    
    <asp:GridView ID="gvMusic" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataSourceID="lnqMusic" EnableModelValidation="True" ForeColor="#333333" 
        GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
           <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                <EditItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="lnkSongLink" Text= '<%# Bind("medTitle") %>' CommandArgument='<%# Bind("medLocation") %>' OnClick="SongLinkButton_Click" runat="server"></asp:LinkButton>
                    
                </ItemTemplate>
            </asp:TemplateField>
                   <asp:BoundField DataField="medArtist" HeaderText="Artist" ReadOnly="True" 
                SortExpression="medArtist" />
            <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True" 
                SortExpression="medDescription" />
            <asp:BoundField DataField="medGenre" HeaderText="Genre" 
                ReadOnly="True" SortExpression="medGenre" />
            <asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" 
                SortExpression="medDuration" />
            <asp:BoundField DataField="medAlbum" HeaderText="Album" ReadOnly="True" 
                SortExpression="medAlbum" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <asp:LinqDataSource ID="lnqMusic" runat="server" 
        ContextTypeName="MediaOnDemand.StorageMediaDataContext" 
        Select="new (medTitle, medArtist, medDescription, medGenre, medDuration, medAlbum, medId, medLocation, medIsViewable, medDateAdded, medMediaType)" 
        TableName="StoredMedias" 
        Where="medMediaType == @medMediaType &amp;&amp; medIsViewable == @medIsViewable">
        <WhereParameters>
            <asp:Parameter DefaultValue="music" Name="medMediaType" Type="String" />
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
