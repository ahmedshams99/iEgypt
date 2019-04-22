<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show_event.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="Home" OnClick="Button1_Click" />
        <div>
        </div>
            <asp:GridView ID ="gvshowevent" runat="server" AutoGenerateColumns ="false" Height="163px" Width="624px">
                <Columns>
                    <asp:BoundField DataField ="id" HeaderText ="ID" />
                    <asp:BoundField DataField ="description" HeaderText ="Description" />
                    <asp:BoundField DataField ="location" HeaderText ="Location" />
                    <asp:BoundField DataField ="city" HeaderText ="City " />
                    <asp:BoundField DataField ="time" HeaderText ="Time" />
                    <asp:BoundField DataField ="entertainer" HeaderText ="Entertainer" />
                    <asp:BoundField DataField ="notification_object_id" HeaderText ="Notification Object ID " />
                    <asp:BoundField DataField ="viewer_id" HeaderText ="Viewer ID " />
                    <asp:BoundField DataField ="first_name" HeaderText ="First Name" />
                    <asp:BoundField DataField ="middle_name" HeaderText ="Middle Name" />
                    <asp:BoundField DataField ="last_name" HeaderText ="Last Name" />
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
