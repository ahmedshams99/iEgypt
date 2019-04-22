<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewerProfile.aspx.cs" Inherits="WebSite5_ViewerProfile" %>

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
        Working Place:<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        Working Place Type:<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        Working Place Description:<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br /><asp:Button ID="Button5" runat="server" Text="Create an event" OnClick="createEvent"/>
        <br />
        <br /><asp:Button ID="Button6" runat="server" Text="Apply for an existing request" OnClick="ApplyExistingReq"/>
        <br />
        <br /><asp:Button ID="Button7" runat="server" Text="Apply for a new request" OnClick="ApplyrNewReq" />
        <br />
        <br /><asp:Button ID="Button8" runat="server" Text="Delete any new request" OnClick="DeleteReq"/>
        <br />
        <br /><asp:Button ID="Button9" runat="server" Text="Review original content" OnClick="ReviewOrigCont"/>
        <br />
        <br /><asp:Button ID="Button10" runat="server" Text="Write a comment" OnClick="WriteComment"/>
        <br />
        <br /><asp:Button ID="Button11" runat="server" Text="Edit and delete my comments" OnClick="EditDeleteCommment" />
        <br />
        <br /><asp:Button ID="Button12" runat="server" Text="Create an advertisment" OnClick="CreateAD"/>
        <br />
        <br /><asp:Button ID="Button13" runat="server" Text="Edit and delete my advertisments" OnClick="EditDeleteAD"/>
        <br />
        <br /><asp:Button ID="Button14" runat="server" Text="Show the new contents" OnClick="ShowNewContent"/>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" OnClick="Button1_Click" />
        <br />
        
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Deactivate Profile" />
        <br />
        
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Log off" />
    </form>
</body>
</html>
