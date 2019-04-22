<%@ Page Language="C#" AutoEventWireup="true" CodeFile="part1.aspx.cs" Inherits="part1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID1,ID2" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="content_manager_id" HeaderText="content_manager_id" SortExpression="content_manager_id" />
                <asp:BoundField DataField="reviewer_id" HeaderText="reviewer_id" SortExpression="reviewer_id" />
                <asp:CheckBoxField DataField="review_status" HeaderText="review_status" SortExpression="review_status" />
                <asp:CheckBoxField DataField="filter_status" HeaderText="filter_status" SortExpression="filter_status" />
                <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                <asp:BoundField DataField="category_type" HeaderText="category_type" SortExpression="category_type" />
                <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" SortExpression="subcategory_name" />
                <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                <asp:BoundField DataField="first_name" HeaderText="first_name" SortExpression="first_name" />
                <asp:BoundField DataField="middle_name" HeaderText="middle_name" SortExpression="middle_name" />
                <asp:BoundField DataField="last_name" HeaderText="last_name" SortExpression="last_name" />
                 <asp:TemplateField>
                    <ItemTemplate>
                     <asp:LinkButton ID="Accept"  Text="Accept" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="accept" />

                    </ItemTemplate>
                    


                </asp:TemplateField>
                <asp:TemplateField>
                    
                    <ItemTemplate>
                     <asp:LinkButton ID="Reject"  Text="Reject" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="reject" />

                    </ItemTemplate>


                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="show_content_to_be_filtered" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;</p>
        <p>
        
        
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
