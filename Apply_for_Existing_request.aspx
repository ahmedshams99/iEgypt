<%@ Page Title="Apply for existing request" Language="C#"  AutoEventWireup="true" CodeFile="Apply_for_Existing_request.aspx.cs" Inherits="Apply_for_Existing_request" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
    <asp:Label id="L1" runat="server"/>
	<form id="form1" runat="server">   
		<asp:Label ID="Label1" runat="server" Text="Select content to be requested"></asp:Label>
       
    <br>
    <br>
    <br>
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText ="First name" />
                <asp:BoundField DataField="middle_name" HeaderText ="Middle name" />
                <asp:BoundField DataField="last_name" HeaderText ="Last name" />
                <asp:BoundField DataField="rating" HeaderText ="Rating" />
                <asp:BoundField DataField="link" HeaderText ="Link" />
                <asp:BoundField DataField="uploaded_at" HeaderText ="Time of uploading" />
                <asp:BoundField DataField="category_type" HeaderText ="Categoty Type" />
                <asp:BoundField DataField="subcategory_name" HeaderText ="SubCategory Type" />
                <asp:BoundField DataField="type" HeaderText ="Type" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" Text="Request" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
	</form>
        
       
</body>
</html>
