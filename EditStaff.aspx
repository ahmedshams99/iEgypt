<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditStaff.aspx.cs" Inherits="WebSite5_EditStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Email:<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Password:<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            First Name:<br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            Middle Name:<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            Last Name:<br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            Birth Date:<br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            Hire Date:<br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            Working Hours:<br />
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            Payment Rate:<br />
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
    </form>
</body>
</html>
