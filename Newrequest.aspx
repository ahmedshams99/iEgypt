<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Newrequest.aspx.cs" Inherits="_Default" %>

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
            <asp:GridView ID ="gvRequest" runat="server" AutoGenerateColumns =" False">
                <Columns>
                    <asp:BoundField DataField ="specified" HeaderText ="Specified" />
                    <asp:BoundField DataField ="information" HeaderText ="Request Information" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="accept" Text="Accept" runat="server" CommandArgument ='<%# Eval("id") %>' onclick="accept_Click" />
                            <asp:LinkButton ID="reject" Text="Reject" runat="server" CommandArgument ='<%# Eval("id") %>' OnClick="reject_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </form>
</body>
</html>
