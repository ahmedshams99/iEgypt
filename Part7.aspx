<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part7.aspx.cs" Inherits="Part7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Viewer_id,original_content_id,date" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Viewer_id" HeaderText="Viewer_id" ReadOnly="True" SortExpression="Viewer_id" />
                <asp:BoundField DataField="original_content_id" HeaderText="original_content_id" ReadOnly="True" SortExpression="original_content_id" />
                <asp:BoundField DataField="date" HeaderText="date" ReadOnly="True" SortExpression="date" DataFormatString="{0:MM/dd/yyyy}"/>
                
                <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                <asp:TemplateField>
                    <ItemTemplate>
                     <asp:LinkButton ID="Delete"  Text="Delete" runat="server" CommandArgument='<%# Eval("date") + ";" + Eval("original_content_id") + ";" + Eval("Viewer_id")%>'
                         OnClick="delete"  />

                    </ItemTemplate>
                    


                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="select * from Comment"></asp:SqlDataSource>
        
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        
    </form>
</body>
</html>
