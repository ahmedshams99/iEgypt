<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="_Default" %>

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
        <p>
            <asp:GridView ID ="gvcontent" runat="server" AutoGenerateColumns =" False">
                <Columns>
                    <asp:BoundField DataField ="ID" HeaderText ="Content ID" />
                    <asp:BoundField DataField ="link" HeaderText ="Content Link" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="Delete" Text="Delete Content" runat="server" OnClick="Delete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
    </form>
</body>
</html>
