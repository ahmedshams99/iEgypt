<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="WebSite5_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        Full Name:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        Email:
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        BirthDate:
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        Password:
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Deactivate Profile" />
    </form>
</body>
</html>
