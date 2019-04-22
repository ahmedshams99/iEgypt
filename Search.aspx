<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="HomePage" />
            <br />
            Search for Original Content by:<br />
            <asp:RadioButton ID="Type" runat="server" GroupName="OriginalContentSearch" Checked="True" Text="Type" />
            <asp:RadioButton ID="Category" runat="server" GroupName="OriginalContentSearch" Text="Category" />
            <br />
            <asp:TextBox ID="CategoryTypeSearch" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        <br />
        <br />
        <div>
            Search for Contributor by full name:<br />
            <asp:TextBox ID="ContributorSearch" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />
        <br />
        Search for Approved Original Content:<br />
        <asp:CheckBox ID="CheckBox1" runat="server" Text="Specify a Contributor by full name" />
        <br />
            <asp:TextBox ID="ApprovedOContent" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button4" runat="server" Text="Search" OnClick="Button4_Click" />
        <br />
        List of all contributors sorted by years of experience:<br />
        <asp:Button ID="Button3" runat="server" Text="Search" OnClick="Button3_Click" />
        <p>
            <asp:Label ID="L1" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
