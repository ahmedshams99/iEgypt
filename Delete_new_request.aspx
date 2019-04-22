<%@ Page Title="delete new request" Language="C#"  AutoEventWireup="true" CodeFile="Delete_new_request.aspx.cs" Inherits="Delete_new_request" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   
		<asp:Label ID="Label1" runat="server" Text="Select a request to be deleted if there is any"></asp:Label>
        
    <br>
    <br>
    <br>
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText ="First name" />
                <asp:BoundField DataField="middle_name" HeaderText ="Middle name" />
                <asp:BoundField DataField="last_name" HeaderText ="Last name" />
                <asp:BoundField DataField="email" HeaderText ="Email" />
                <asp:BoundField DataField="information" HeaderText ="Information" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" Text="Delete" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
	</form>
        
       
</body>
</html>
