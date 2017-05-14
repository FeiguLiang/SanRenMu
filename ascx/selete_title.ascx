<%@ Control Language="C#" AutoEventWireup="true" CodeFile="selete_title.ascx.cs" Inherits="ascx_selete_title" %>
<asp:Repeater ID="Repeater1" runat="server">
<HeaderTemplate>
<table>
<tr width=549px;><td><font color="white"><asp:Label ID="Label1" runat="server" Text="Label">日志分类：</asp:Label></font></td>
</HeaderTemplate>
<ItemTemplate>
<td width="80"><img src="images/arrow.gif" /><a href="edit.aspx?type=<%# Eval("type_id") %>"><%# Eval("type_title") %></a></td>
</ItemTemplate>
<FooterTemplate>
</tr>
</table>
</FooterTemplate>
</asp:Repeater>
