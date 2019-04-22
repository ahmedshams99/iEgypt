<%@ Page Title="comment" Language="C#"  AutoEventWireup="true" CodeFile="comment.aspx.cs" Inherits="comment" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   
		Add Comment<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="131px" Width="1045px"></asp:TextBox>
	<br />
    <br>
        
        
        <asp:Label ID="Label1" runat="server" Text="Select content to comment on"></asp:Label>
        
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
                        <asp:LinkButton ID="lnkSelect" Text="Comment" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="lnkSelect_Click" />
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
