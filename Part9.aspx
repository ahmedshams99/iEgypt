<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part9.aspx.cs" Inherits="Part9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="Select Contributor.* into temp from Contributor 
INNER JOIN Content on Content.contributer_id=Contributor.ID
INNER JOIN New_Request on New_Request.contributer_id=Contributor.ID
order by (DATEDIFF(MINUTE,Content.uploaded_at,New_Request.accepted_at)) asc,
(select count(*) New_Request where New_Request.contributer_id=Contributor.ID) desc;
select distinct portfolio_link	,years_of_experience	,specialization from temp;
drop table temp;"></asp:SqlDataSource>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
