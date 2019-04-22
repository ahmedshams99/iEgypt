<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Part6.aspx.cs" Inherits="Part6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="seen_at" HeaderText="seen_at" SortExpression="seen_at" />
                    <asp:BoundField DataField="sent_at" HeaderText="sent_at" SortExpression="sent_at" />
                    <asp:BoundField DataField="notified_person_id" HeaderText="notified_person_id" SortExpression="notified_person_id" />
                    <asp:BoundField DataField="notification_object_id" HeaderText="notification_object_id" SortExpression="notification_object_id" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="Show_Notification" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="user_id" SessionField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Profile" />
        </p>
    </form>
</body>
</html>
