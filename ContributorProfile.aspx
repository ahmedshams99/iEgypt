<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContributorProfile.aspx.cs" Inherits="WebSite5_ContributorProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="HomePage" />
        <br />
        Full Name:
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        Email:
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        BirthDate:
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        Age:<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
        <br />
        Password:
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        Years of Experience:<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        PortFolio Link:<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        Specialization:<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" OnClick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Deactivate Profile" />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Log off" />
        <p>
            <asp:Button ID="Button7" runat="server" Text="Upload Original Content" OnClick="Button7_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button9" runat="server" Text="Upload New Content" OnClick="Button9_Click" />
        </p>
        <p>
            <asp:Button ID="Button5" runat="server" Text="New Requests" OnClick="Button5_Click" />
        </p>
        <p>
        <asp:Button ID="Button6" runat="server" Text="Send Message to viewer" OnClick="Button6_Click" />
        </p>
        <asp:Button ID="Button8" runat="server" Text="Messages Recieved" OnClick="Button8_Click" />
        <p>
            <asp:Button ID="Button10" runat="server" Text="Delete Content" OnClick="Button10_Click"/>
        </p>
        <asp:Button ID="Button11" runat="server" Text="Show Notification" OnClick="Button11_Click" />
        <p>
            <asp:Button ID="Button12" runat="server" Text="Show Events" OnClick="Button12_Click" />
        </p>
        <asp:Button ID="Button13" runat="server" Text="Show Advertisements" OnClick="Button13_Click"/>
    </form>
</body>
</html>
