<%@ Page Title="edit comment" Language="C#"  AutoEventWireup="true" CodeFile="edit_comment.aspx.cs" Inherits="edit_comment" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   
		New Comment<br />
        <asp:TextBox ID="TextBox1" runat="server" Height="131px" Width="1045px"></asp:TextBox>
	<br />
    <br>
        
        
        <asp:Label ID="Label1" runat="server" Text="Comments:"></asp:Label>
        
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
                <asp:BoundField DataField="text" HeaderText ="Comment" />
                <asp:BoundField DataField="date" HeaderText ="Commented at" />
                
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect1" Text="Edit" runat="server" CommandArgument='<%# Eval("ID")+";"+Eval("date") %>' OnClick="edit_Click" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect2" Text="Delete" runat="server" CommandArgument='<%# Eval("ID")+";"+Eval("date") %>' OnClick="delete_Click" />
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
