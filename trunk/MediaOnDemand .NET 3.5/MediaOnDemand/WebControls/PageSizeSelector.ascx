<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageSizeSelector.ascx.cs" Inherits="MediaOnDemand.WebControls.PageSizeSelector" %>

<table>
<tr>
<td style="width:75%">
<table>
        <tr>
        <td>
            <asp:Label ID="lblPageSize" runat="server" Text="Items per page: "></asp:Label>
        </td>
        <td>
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="True" 
                onselectedindexchanged="ddlPageSize_SelectedIndexChanged">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem Value="all">All</asp:ListItem>
            </asp:DropDownList>
        </td>
        </tr>
        </table>
</td>
<td>
 <td align="right">            
               <asp:Label ID="lblRecordCount" runat="server" Text=""></asp:Label>
            </td>   
</td>
</tr>
</table>