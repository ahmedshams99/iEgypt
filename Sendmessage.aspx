<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sendmessage.aspx.cs" Inherits="Default2" %>

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
            <asp:GridView ID ="gvViewer" runat="server" AutoGenerateColumns =" False">
                <Columns>
                    <asp:BoundField DataField ="ID" HeaderText ="Viewer ID" />
                    <asp:BoundField DataField ="first_name" HeaderText ="First Name" />
                    <asp:BoundField DataField ="middle_name" HeaderText ="Middle Name" />
                    <asp:BoundField DataField ="last_name" HeaderText ="Last Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="select" Text="Send Message" runat="server" OnClick="select_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <asp:TextBox ID="TextBox1" runat="server" Height="31px" Width="323px"></asp:TextBox>
    </form>
</body>
</html>
