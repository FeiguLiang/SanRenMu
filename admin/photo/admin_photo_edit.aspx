<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_photo_edit.aspx.cs" Inherits="admin_photo_admin_photo_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Label ID="Label4" runat="server" Text="Label" Font-Names="宋体" Font-Size="12px">当前位置:编辑文章</asp:Label><br />
        <hr /><br />
    <asp:Label ID="Label3" runat="server" Text="类别：" Font-Names="宋体" Font-Size="12px"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" Width="112px" Font-Names="宋体" Font-Size="12px">
        </asp:DropDownList>
        <br />
        <asp:Label ID="Label1" runat="server" Text="标题：" Font-Names="宋体" Font-Size="12px"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" Width="118px" Font-Names="宋体" Font-Size="12px"></asp:TextBox><br />
        <asp:Label ID="Label2" runat="server" Text="内容：" Font-Names="宋体" Font-Size="12px"></asp:Label><br />
        &nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="222px" Width="375px"></asp:TextBox><asp:Image
            ID="Image1" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="提交" Font-Names="宋体" Font-Size="12px" />
       
    </div>
    </form>
</body>
</html>
