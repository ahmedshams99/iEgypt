<%@ Page Language="C#" AutoEventWireup="true" CodeFile="part3.aspx.cs" Inherits="part3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Create A New Content Type"></asp:Label>
        <div>
        </div>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Content Type Name"></asp:Label>
        </p>
        <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create" />
        </p>
        <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
