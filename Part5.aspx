<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part5.aspx.cs" Inherits="Part5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" >
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="Workingplace_Category_Relation" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
