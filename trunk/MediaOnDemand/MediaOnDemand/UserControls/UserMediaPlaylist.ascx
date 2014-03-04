<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserMediaPlaylist.ascx.cs" Inherits="MediaOnDemand.UserControls.UserMediaPlaylist" %>

<div style="text-align:center; width:200px; margin-left:auto; margin-right:auto">

<h1>
Media Playlist
</h1>

<asp:ListView ID="lvUserMediaPlaylist" runat="server" 
    DataSourceID="lnqUserMediaPlaylist" EnableModelValidation="True" 
    DataKeyNames="plstMediaId,plstUserName">
   
    <EmptyDataTemplate>
        <span>Your playlist is empty</span>
    </EmptyDataTemplate>
    
    <ItemTemplate>
        <span style="">
        <table width="100%">
        <tr>
        <td width="30px">
        <asp:ImageButton ID="DeleteButton" ImageUrl="~/images/Buttons/deleteButton.png" Width="35px" Height="35px" CommandName="Delete" runat="server" />
        </td>
         <td align="center">
    
            <a  href="#" onclick="ForcePostBack(this, 'video')" mediatitle='<%# Eval("plstMediaTitle") %>'
                                                param='<%# Eval("plstMediaLocation") %>' mediaid='<%# Eval("plstMediaId") %>'>
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Bind("plstMediaTitle") %>'></asp:Label>
                                            </a>

        </td>
        </tr>
        </table>
                
        <%--<asp:Button ID="DeleteButton"  runat="server" CommandName="Delete" 
            Text="Delete" />--%>
<br /><br /></span>
    </ItemTemplate>
    <LayoutTemplate>
        <div ID="itemPlaceholderContainer" runat="server" style="">
            <span runat="server" id="itemPlaceholder" />
        </div>
        <div style="">
        </div>
    </LayoutTemplate>    
 </asp:ListView>
 </div>

<asp:HiddenField ID="hdnUserName" runat="server" />

<asp:LinqDataSource ID="lnqUserMediaPlaylist" runat="server" 
    ContextTypeName="MediaOnDemand.StorageMediaDataContext" EnableDelete="True" 
    EnableUpdate="True" OrderBy="plstPlaylistIndex" TableName="UserMediaPlayLists" 
    Where="plstUserName == @plstUserName">
    <WhereParameters>
        <asp:ControlParameter ControlID="hdnUserName" 
            DefaultValue="Membership.GetUser().UserName" Name="plstUserName" 
            PropertyName="Value" Type="String" />
    </WhereParameters>
</asp:LinqDataSource>
