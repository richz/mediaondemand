<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchMovies.aspx.cs" Inherits="MediaOnDemand.WatchMovies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/playMedia.js" type="text/javascript"></script>
    
    <!-- 
		include flowplayer JavaScript file that does  
		Flash embedding and provides the Flowplayer API.
	-->
	<script type="text/javascript" src="flowplayer-3.1.4.min.js"></script>
	
	<!-- some minimal styling, can be removed -->
	<link rel="stylesheet" type="text/css" href="style.css">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     
    <asp:HiddenField ID="hdnFilePath" runat="server" />
     
    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
     
    <%-- <embed type="application/x-vlc-plugin"
         name="video1"
         autoplay="no" loop="yes" width="400" height="300"
         target="NapoleonDynamite.VOB" />
<br />
  <a href="javascript:;" onclick='document.video1.play()'>Play video1</a>
  <a href="javascript:;" onclick='document.video1.pause()'>Pause video1</a>
  <a href="javascript:;" onclick='document.video1.stop()'>Stop video1</a>
  <a href="javascript:;" onclick='document.video1.fullscreen()'>Fullscreen</a>--%>

     
	<!-- this will install flowplayer inside previous A- tag. -->
		<script>
		    flowplayer("player", "../flowplayer-3.1.5.swf");
		</script>
		
	
		
     
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
