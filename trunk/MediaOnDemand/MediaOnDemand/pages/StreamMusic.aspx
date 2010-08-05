<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StreamMusic.aspx.cs"
    Inherits="MediaOnDemand.StreamMusic" %>

<%@ Register Assembly="Media-Player-ASP.NET-Control" Namespace="Media_Player_ASP.NET_Control"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <script src="../js/playMedia.js" type="text/javascript"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Music</h1>
        
        <script type="text/javascript">

        function showMediaInMainWindow() {

            if (_arrWin[0]) {

                var mediaUrl = document.getElementById('ctl00_MainContent_hdnMediaUrl').getAttribute('value');

                _arrWin[0] = null;

                var btnPlayInPopup = document.getElementById('btnPlayInPopup');

                if (btnPlayInPopup != null)
                    btnPlayInPopup.disabled = '';
            }
        }
    
    </script>
        
    
    <script type="text/javascript"><%= postBackStr %></script>

    <asp:Label ID="lblFileMessages" runat="server" Text="Label"></asp:Label>
     <center>
    <table>
        <tr>
            <td>
                <table>
                    <tr>
                        <td align="right" style="width: 50%">
                            <asp:Label ID="lblArtist" runat="server" Text="Please choose an artist:"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="artistUpdatePanel" runat="server">
                                <ContentTemplate>
                                    <asp:DropDownList ID="ddlArtist" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlArtist_SelectedIndexChanged">
                                    </asp:DropDownList>
                              </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>            
        </tr>
        <tr>
        <td colspan="2" align="center">
        <%--<input type="button" id="btnPlayInPopup" value="Show In Popup Window"  disabled="disabled"  onclick="showMediaInPopupWindow()" />--%>
        </td>
        </tr>
        </table>
       
              <div id="mediaPlayer">
              
                  
              
              <a id="player" href="" style="display: block; width: 100%; height: 100%">
                                                                                 
                           </a>
              
              </div>
              </center>
            
         <asp:UpdatePanel ID="gridViewUpdatePanel" runat="server">
                    <ContentTemplate>
        <table width="100%">
        <tr>
            <td id="PageSize" style="width: 75%">
               
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">10</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem Value="all">All</asp:ListItem>
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
              
                        <center>
                            <asp:GridView ID="gvMusic" Width="100%" runat="server" AllowPaging="True" AllowSorting="True"
                                AutoGenerateColumns="False" CellPadding="4" DataSourceID="lnqMusic" EnableModelValidation="True"
                                ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Title" SortExpression="medTitle">
                                        <ItemTemplate>
                                            <a id="lnkMusicLink" href="#" onclick="ForcePostBack('mainwindow', '<%# Eval("medLocation") %>','<%# Eval("medTitle") %>' ,'music', this, '<%# Eval("medId") %>')">
                                                <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("medTitle") %>'></asp:Label>
                                            </a>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="medArtist" HeaderText="Artist" ReadOnly="True" SortExpression="medArtist" />
                                    <asp:BoundField DataField="medDescription" HeaderText="Description" ReadOnly="True"
                                        SortExpression="medDescription" />
                                    <asp:BoundField DataField="medGenre" HeaderText="Genre" ReadOnly="True" SortExpression="medGenre" />
                                    <asp:BoundField DataField="medDuration" HeaderText="Duration" ReadOnly="True" SortExpression="medDuration" />
                                    <asp:BoundField DataField="medAlbum" HeaderText="Album" ReadOnly="True" SortExpression="medAlbum" />
                                    <asp:BoundField DataField="medDateAdded" DataFormatString="{0:G}" HeaderText="Date Added">
                                        <HeaderStyle Font-Underline="True" />
                                        <ItemStyle Font-Underline="False" />
                                    </asp:BoundField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <table cellspacing="0" cellpadding="4" border="0" id="ctl00_MainContent_gvMedia"
                    style="color: #333333; border-collapse: collapse;" width="100%">
                    <tr align="left" style="color: White; background-color: #284775;">
                        <td colspan="12">
                        </td>
                    </tr>
                    <tr style="color: White; background-color: #5D7B9D; font-weight: bold;">
                       
                        <th scope="col">
                            <a style="color: White;"><u>Title</u></a>
                        </th>
                                             
                        <th scope="col">
                            <a style="color: White;"><u>Artist</u></a>
                        </th>
                        <th scope="col">
                            <a style="color: White;"><u>Description</u></a>
                        </th>
                       
                        <th scope="col">
                            <a style="color: White;"><u>Genre</u></a>
                        </th>
                       
                        <th scope="col">
                            <a style="color: White;"><u>Duration</u></a>
                        </th>
                        <th scope="col">
                            <a style="color: White;"><u>Album</u></a>
                        </th>
                        <th scope="col">
                            <a style="color: White;"><u>Date Added</u></a>
                        </th>
                        </tr>
                        <tr>
                        <td colspan="10">
                        <center>
                        No records found
                        </center>
                        </td>
                        </tr>
                </table>
                                </EmptyDataTemplate>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                            </td> </tr> </table>
                        </center>
                
            </td>
        </tr>
    </table>   
     </ContentTemplate>
                </asp:UpdatePanel>
    <asp:LinqDataSource ID="lnqMusic" runat="server" ContextTypeName="MediaOnDemand.StorageMediaDataContext"
        Select="new (medTitle, medArtist, medDescription, medGenre, medDuration, medAlbum, medId, medLocation, medIsViewable, medDateAdded, medMediaType)"
        TableName="StoredMedias" Where="medMediaType == @medMediaType &amp;&amp; medIsViewable == @medIsViewable &amp;&amp; medArtist == @medArtist"
        OnSelected="lnqMusic_Selected">
        <WhereParameters>
            <asp:Parameter DefaultValue="music" Name="medMediaType" Type="String" />
            <asp:Parameter DefaultValue="Y" Name="medIsViewable" Type="Char" />
            <asp:ControlParameter ControlID="ddlArtist" Name="medArtist" PropertyName="SelectedValue"
                Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    
     <asp:HiddenField ID="hdnMediaUrl" Value="" runat="server" />
     <asp:HiddenField ID="hdnMediaId" Value="" runat="server" />    
    <asp:HiddenField ID="hdnMediaTitle" Value="" runat="server" />    
    <asp:HiddenField ID="hdnTotalRowCount" runat="server" />
</asp:Content>
