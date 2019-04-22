<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part8.aspx.cs" Inherits="Part8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"  ProviderName="System.Data.SqlClient" SelectCommand="select * from Original_Content inner join Content on  Content.ID = Original_Content.ID;"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Text="New Content"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID1" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="new_request_id" HeaderText="new_request_id" SortExpression="new_request_id" />
                    <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at" SortExpression="uploaded_at" />
                    <asp:BoundField DataField="contributer_id" HeaderText="contributer_id" SortExpression="contributer_id" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" SortExpression="category_type" />
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" SortExpression="subcategory_name" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                     <asp:TemplateField>
                    
                    <ItemTemplate>
                     <asp:LinkButton ID="Delete_New"  Text="Delete" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="delete" />

                    </ItemTemplate>


                </asp:TemplateField>
                </Columns>
                          </asp:GridView>
              <br />
            <br />

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="select * from New_Content inner join Content on Content.ID = New_Content.ID;"></asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server" Text="Original Content"></asp:Label>
        </div>
          <br />
            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID,ID1" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="content_manager_id" HeaderText="content_manager_id" SortExpression="content_manager_id" />
                    <asp:BoundField DataField="reviewer_id" HeaderText="reviewer_id" SortExpression="reviewer_id" />
                    <asp:CheckBoxField DataField="review_status" HeaderText="review_status" SortExpression="review_status" />
                    <asp:CheckBoxField DataField="filter_status" HeaderText="filter_status" SortExpression="filter_status" />
                    <asp:BoundField DataField="rating" HeaderText="rating" ReadOnly="True" SortExpression="rating" />
                   
                   
                    <asp:BoundField DataField="link" HeaderText="link" SortExpression="link" />
                    <asp:BoundField DataField="uploaded_at" HeaderText="uploaded_at" SortExpression="uploaded_at" />
                    <asp:BoundField DataField="contributer_id" HeaderText="contributer_id" SortExpression="contributer_id" />
                    <asp:BoundField DataField="category_type" HeaderText="category_type" SortExpression="category_type" />
                    <asp:BoundField DataField="subcategory_name" HeaderText="subcategory_name" SortExpression="subcategory_name" />
                    <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                     <asp:TemplateField>
                    
                    <ItemTemplate>
                     <asp:LinkButton ID="Delete_Original"  Text="Delete" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="delete" />

                    </ItemTemplate>


                </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <br />
            <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
