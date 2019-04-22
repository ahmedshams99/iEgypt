<%@ Page Title="create publicity ad" Language="C#"  AutoEventWireup="true" CodeFile="create_publicity_ad.aspx.cs" Inherits="create_publicity_ad" %>

<!DOCTYPE html>
<html>
<head runat="server">
    Create Publicity AD
    <style type="text/css">
        #form1 {
            height: 318px;
        }
    </style>

</head>
<body>
    <br>
    <br>
	<form id="form1" runat="server"> 
        Description:<br />
        <asp:TextBox ID="Description" runat="server" Height="100px" Width="1000px"></asp:TextBox><br />
        Location:<br />
        <asp:TextBox ID="Location" runat="server" Height="100px" Width="1000px"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Create AD" OnClick="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
	</form>
        
       
</body>
</html>
