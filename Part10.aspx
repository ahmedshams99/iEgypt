<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part10.aspx.cs" Inherits="Part_10" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
       
        
        <p>
            <asp:Label ID="Label1" runat="server" Text="New Requests"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:CheckBoxField DataField="accept_status" HeaderText="accept_status" SortExpression="accept_status" />
                    <asp:BoundField DataField="information" HeaderText="information" SortExpression="information" />
                    <asp:BoundField DataField="viewer_id" HeaderText="viewer_id" SortExpression="viewer_id" />
                    <asp:BoundField DataField="notif_obj_id" HeaderText="notif_obj_id" SortExpression="notif_obj_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="select * from New_Request where specified = 0;"></asp:SqlDataSource>
        </p>
       
        
    <p>
        <asp:Label ID="Label2" runat="server" Text="Choose New Request ID"></asp:Label>
        </p>
       
        
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
           
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="years_of_experience" HeaderText="years_of_experience" SortExpression="years_of_experience" />
                    <asp:BoundField DataField="portfolio_link" HeaderText="portfolio_link" SortExpression="portfolio_link" />
                    <asp:BoundField DataField="specialization" HeaderText="specialization" SortExpression="specialization" />
                    <asp:TemplateField>
                    <ItemTemplate>
                     <asp:LinkButton ID="Assign"  Text="Assign" runat="server" CommandArgument='<%# Eval("ID") %>' OnClick="assign" />

                    </ItemTemplate>
                    


                </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="Show_Possible_Contributors" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
           
        
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
           
        
    </form>
    </body>
</html>
