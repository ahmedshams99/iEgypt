<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recievemessage.aspx.cs" Inherits="_Default" %>

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
        <asp:GridView ID ="gvrecievemessage" runat="server" AutoGenerateColumns =" False">
                <Columns>
                    <asp:BoundField DataField ="text" HeaderText ="Message Text" />
                    <asp:BoundField DataField ="first_name" HeaderText ="First Naame" />
                    <asp:BoundField DataField ="middle_name" HeaderText ="Middle Name" />
                    <asp:BoundField DataField ="last_name" HeaderText ="Last Name" />
                    <asp:BoundField DataField ="sent_at" HeaderText ="Sent At" />      
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
