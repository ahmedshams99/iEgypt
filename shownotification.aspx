<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shownotification.aspx.cs" Inherits="shownotification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Button1_Click" />
        </div>
            <asp:GridView ID ="gvshownotif" runat="server" AutoGenerateColumns ="false" Height="144px" Width="517px">
                <Columns>
                    <asp:BoundField DataField ="ID" HeaderText ="ID" />
                    <asp:BoundField DataField ="seen_at" HeaderText ="seen_at" />
                    <asp:BoundField DataField ="sent_at" HeaderText ="sent_at " />
                    <asp:BoundField DataField ="notified_person_id" HeaderText ="notified_person_id" />
                    <asp:BoundField DataField ="notification_object_id" HeaderText ="notification_object_id" />

                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
