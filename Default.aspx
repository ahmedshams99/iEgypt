<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Don't have an account?"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="register.aspx">Register</asp:HyperLink>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Search.aspx">Search</asp:HyperLink>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="My Profile" />
        </div>
    </form>
</body>
</html>
