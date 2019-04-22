<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StaffProfile.aspx.cs" Inherits="WebSite5_StaffProfile" %>

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
        Age:<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
        <br />
        Password:
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        Hire Date:<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        Working Hours:<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        Payment Rate:<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <br />
        Total Salary:<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Edit Profile" OnClick="Button1_Click" />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Deactivate Profile" />
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Log off" />
		
		
		
		 <br />
		
		<br />
        <br />
		<br />
		 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Part1.aspx">Filter Content</asp:HyperLink>
        		<br />

            <br />
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="Part2.aspx">Create Category/Subcategory</asp:HyperLink>
            <br />
              <br />
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="Part3.aspx">Create New Content Type</asp:HyperLink>
            <br />
              <br />
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="Part4.aspx">Show Existing Requests ordered by the number of requests descendingly.</asp:HyperLink>
            <br />
             <br />
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="Part5.aspx">Show the number of new and existing requests created for new/original content(s) that belongs to
a certain category</asp:HyperLink>
            <br />
             <br />
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="Part6.aspx">Show Notifications</asp:HyperLink>
            <br />
             <br />
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="Part7.aspx">Delete Comment</asp:HyperLink>
            <br />
             <br />
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="Part8.aspx">Delete Content</asp:HyperLink>
            <br />
             <br />
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="Part9.aspx">Order Contributors</asp:HyperLink>
            <br />

             <br />
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="Part10.aspx">Assign Contributor</asp:HyperLink>
            <br />
		
    </form>
</body>
</html>
