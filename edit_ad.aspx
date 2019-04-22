<%@ Page Title="edit ad" Language="C#"  AutoEventWireup="true" CodeFile="edit_ad.aspx.cs" Inherits="edit_ad" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server">   
		Description:<br />
        <asp:TextBox ID="Description" runat="server" Height="100px" Width="1000px"></asp:TextBox><br /><br />
        Location:<br />
        <asp:TextBox ID="Location" runat="server" Height="100px" Width="1000px"></asp:TextBox><br /><br />
	<br />
    <br>
        
        
        <asp:Label ID="Label1" runat="server" Text="Content:"></asp:Label>
        
    <br>
    <br>
        <asp:GridView ID="myTable" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="description" HeaderText ="Description" />
                <asp:BoundField DataField="location" HeaderText ="Location" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect1" Text="Edit" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="edit_Click" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect2" Text="Delete" runat="server" CommandArgument='<%# Eval("id") %>' OnClick="delete_Click" />
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
