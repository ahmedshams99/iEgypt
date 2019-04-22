<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditViewer.aspx.cs" Inherits="WebSite5_EditViewer" %>

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
            Working Place Name:<br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            Working Place Type:<br />
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            Working Place Description:<br />
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
