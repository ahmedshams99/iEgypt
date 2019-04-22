<%@ Page Language="C#" AutoEventWireup="true" CodeFile="uploadoriginalcontent.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button2" runat="server" Text="Home" OnClick="Button2_Click" />
        </div>
        <p>
            <asp:GridView ID ="gvuploadoriginal" runat ="server" AutoGenerateColumns ="false" Height="135px" Width="260px">
                <Columns>
                    <asp:BoundField DataField="type" HeaderText ="Content Type" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="select" Text="Select" runat="server" CommandArgument='<%# Eval("type") %>' OnClick="select_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

         <asp:GridView ID ="gvsubcategory" runat ="server" AutoGenerateColumns ="false" Height="135px" Width="260px" >
                <Columns>
                    <asp:BoundField DataField="name" HeaderText ="Subcategory Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="select1" Text="Select" runat="server" CommandArgument='<%# Eval("[name]") %>' OnClick="select_Click1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

            <asp:GridView ID ="gvcategory" runat ="server" AutoGenerateColumns ="false" Height="135px" Width="260px">
                <Columns>
                    <asp:BoundField DataField="type" HeaderText ="Category Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="select2" Text="Select" runat="server" CommandArgument='<%# Eval("[type]") %>' OnClick="select2_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        </p>
        <p>

            <asp:TextBox ID="TextBox1" runat="server" Height="20px" OnTextChanged="TextBox1_TextChanged" Width="385px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="19px" Text="Upload" Width="153px" OnClick="Button1_Click1" />
        </p>
    </form>
</body>
</html>
