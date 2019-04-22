<%@ Page Language="C#" AutoEventWireup="false" CodeFile="register.aspx.cs" Inherits="WebSite5_register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="HomePage" />
            <br />
            Email<br />
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            First Name<br />
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            Middle Name<br />
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            Last Name<br />
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            Birth Date<br />
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <asp:RadioButton ID="Viewer" runat="server" Checked="True" OnCheckedChanged="RadioButton1_CheckedChanged" Text="Viewer" AutoPostBack="True" GroupName="Registration" />
            <asp:RadioButton ID="Contributor" runat="server" OnCheckedChanged="RadioButton2_CheckedChanged" Text="Contributor" AutoPostBack="True" GroupName="Registration" />
            <asp:RadioButton ID="Staff" runat="server" Text="Authorized Reviewer" AutoPostBack="True" GroupName="Registration" OnCheckedChanged="Staff_CheckedChanged" />
            <asp:RadioButton ID="Staff0" runat="server" Text="Content Manager" AutoPostBack="True" GroupName="Registration" OnCheckedChanged="Staff_CheckedChanged" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Working Place"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Working Place Type"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Working Place Description"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Years of Experience" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox12" runat="server" Visible="False" ></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Portfolio Link" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox13" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Specialization" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox14" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label7" runat="server" Text="Hire Date" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox15" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Working Hours" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox16" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Label ID="Label9" runat="server" Text="Payment Rate" Visible="False"></asp:Label>
            <br />
            <asp:TextBox ID="TextBox17" runat="server" Visible="False"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
            <br />
            <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
