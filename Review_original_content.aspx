<%@ Page Title="Review original conent" Language="C#"  AutoEventWireup="true" CodeFile="Review_original_content.aspx.cs" Inherits="Review_original_content" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   <br />
        Insert Rating:
        <asp:TextBox ID="Rating" runat="server"></asp:TextBox>
        <br />
        <br />
		<asp:Label ID="Label1" runat="server" Text="Select Content to be Rated"></asp:Label>
        
    <br>
    <br>
    <br>
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="first_name" HeaderText ="First name" />
                <asp:BoundField DataField="middle_name" HeaderText ="Middle name" />
                <asp:BoundField DataField="last_name" HeaderText ="Last name" />
                <asp:BoundField DataField="rating" HeaderText ="Content's Rating" />
                <asp:BoundField DataField="link" HeaderText ="Content's Link" />
                <asp:BoundField DataField="uploaded_at" HeaderText ="Time of uploading" />
                <asp:BoundField DataField="subcategory_name" HeaderText ="Subcategory Name" />
                <asp:BoundField DataField="category_type" HeaderText ="Categoty Type" />
                <asp:BoundField DataField="subcategory_name" HeaderText ="SubCategory Type" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" Text="Select" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click" />
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
