<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part2.aspx.cs" Inherits="Part2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="CategoryName"></asp:Label>
        <p>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="SubCategoryName"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" Text="Create" />
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
