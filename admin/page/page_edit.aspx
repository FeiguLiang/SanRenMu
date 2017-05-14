<%@ Page Language="C#" AutoEventWireup="true" CodeFile="page_edit.aspx.cs" Inherits="ygy_page_page_edit" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="标题："></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br /><br />
        <asp:Label ID="Label2" runat="server" Text="内容："></asp:Label><br />
    <ftb:freetextbox id="FreeTextBox1" runat="server" Language="zh-CN"></ftb:freetextbox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="确定" />
    </div>
    </form>
</body>
</html>
