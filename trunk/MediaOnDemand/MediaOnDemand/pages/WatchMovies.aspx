<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchMovies.aspx.cs" Inherits="MediaOnDemand.WatchMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
     
    <asp:GridView ID="gvMovies" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="lnqMovies" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
             <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                <EditItemTemplate>
                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="lnkMovieLink" Text= '<%# Bind("medTitle") %>' CommandArgument='<%# Bind("medLocation") %>' OnClick="lnkMovieLink_Click" runat="server"></asp:LinkButton>
                    
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="medArtist" HeaderText="Cast" ReadOnly="True" 
                SortExpression="medArtist" />
            <asp:BoundField DataField="medDescription" HeaderText="Description" 
                ReadOnly="True" SortExpression="medDescription" />
            <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" 
                SortExpression="medGenre" />
            <asp:BoundField DataField="medDuration" HeaderText="Duration" 
                ReadOnly="True" SortExpression="medDuration" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:LinqDataSource ID="lnqMovies" runat="server" 
        ContextTypeName="MediaOnDemand.StorageMediaDataContext" 
        Select="new (medTitle, medLocation, medArtist, medDescription, medIsViewable, medGenre, medDuration)" 
        TableName="StoredMedias" 
        Where="medMediaType == @medMediaType &amp;&amp; medIsViewable == @medIsViewable">
        <WhereParameters>
            <asp:Parameter DefaultValue="movie" Name="medMediaType" Type="String" />
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
