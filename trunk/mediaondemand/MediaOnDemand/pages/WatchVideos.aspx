<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WatchVideos.aspx.cs" Inherits="MediaOnDemand.WatchVideos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Watch Videos</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TreeView ID="TreeView1" runat="server">
        <Nodes>
            <asp:TreeNode NavigateUrl="~/pages/WatchMovies.aspx" Text="M ovies" 
                Value="M ovies">
                <asp:TreeNode NavigateUrl="~/pages/WatchMovies.aspx?genre=action" Text="Action" 
                    Value="Action"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/pages/OtherVideos.aspx" Text="TV Shows" 
                Value="TV Shows"></asp:TreeNode>
            <asp:TreeNode NavigateUrl="~/pages/OtherVideos.aspx" Text="Music Videos" 
                Value="Music Videos"></asp:TreeNode>
        </Nodes>
    </asp:TreeView>
</asp:Content>
