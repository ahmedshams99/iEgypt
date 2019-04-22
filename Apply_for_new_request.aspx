<%@ Page Title="Apply for new request" Language="C#"  AutoEventWireup="true" CodeFile="Apply_for_new_request.aspx.cs" Inherits="Apply_for_new_request" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   
		<asp:Label ID="Label1" runat="server" Text="Select content to be requested"></asp:Label>
        <br />
        <br />
        <br />
        Insert Information *<br>
        <asp:TextBox id="information" runat="server" Height="118px" Width="826px"/><br>
    <br>
    <br>
    <br>
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText ="First name" />
                <asp:BoundField DataField="middle_name" HeaderText ="Middle name" />
                <asp:BoundField DataField="last_name" HeaderText ="Last name" />
                <asp:BoundField DataField="email" HeaderText ="Email" />
                <asp:BoundField DataField="portfolio_link" HeaderText ="Portfolio Link" />
                <asp:BoundField DataField="years_of_experience" HeaderText ="Years of Experience" />
                <asp:BoundField DataField="age" HeaderText ="age" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" Text="Request" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Request with no contributor" OnClick="no_Contributor" />
        <br />
        <br />
        <br />
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
	</form>
        
       
</body>
</html>
