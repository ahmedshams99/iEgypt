<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Showadvertisement.aspx.cs" Inherits="showevent" %>

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
        <asp:GridView ID ="gvshowads" runat="server" AutoGenerateColumns =" False">
                <Columns>
                    <asp:BoundField DataField ="id" HeaderText ="ID" />
                    <asp:BoundField DataField ="description" HeaderText ="Description" />
                    <asp:BoundField DataField ="location" HeaderText ="Location" />
                    <asp:BoundField DataField ="event_id" HeaderText ="Event ID" />
                    <asp:BoundField DataField ="viewer_id" HeaderText ="ViewerID" />
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
