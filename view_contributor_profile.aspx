<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_contributor_profile.aspx.cs" Inherits="view_contributor_profile" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Contributor's Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText ="First name" />
                <asp:BoundField DataField="middle_name" HeaderText ="Middle name" />
                <asp:BoundField DataField="last_name" HeaderText ="Last name" />
                <asp:BoundField DataField="birth_date" HeaderText ="Birth date" />
                <asp:BoundField DataField="age" HeaderText ="Age" />
                <asp:BoundField DataField="email" HeaderText ="Email" />
                <asp:BoundField DataField="years_of_experience" HeaderText ="Years of experience" />
                <asp:BoundField DataField="specialization" HeaderText ="Specialization" />
                <asp:BoundField DataField="portfolio_link" HeaderText ="Portfolio link" />
            </Columns>
        </asp:GridView>
        <br /><br /><br /><br />
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click"/>
    </form>
</body>
</html>
