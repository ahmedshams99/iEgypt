<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part4.aspx.cs" Inherits="Part4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="original_content_id" HeaderText="original_content_id" SortExpression="original_content_id" />
                    <asp:BoundField DataField="Number of Requests" HeaderText="Number of Requests" ReadOnly="True" SortExpression="Number of Requests" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="Most_Requested_Content" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </div>
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
