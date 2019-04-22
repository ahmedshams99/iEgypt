<%@ Page Title="create event" Language="C#" AutoEventWireup="true" CodeFile="create event.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>
<head runat="server">

</head>
<body>
    <asp:Label runat="server">Create an event</asp:Label>
    <br>
    <br>
    <asp:Label id="L1" runat="server"/>
	<form id="form1" runat="server">   

        <p>City</p>
        <asp:TextBox id="City" runat="server"/><br>

        <p>Event date</p>
        <asp:TextBox id="Date" runat="server"/><br>

        <p>Description</p>
        <asp:TextBox id="Description" runat="server"/><br>

        <p>Entartainer</p>
        <asp:TextBox id="Entartainer" runat="server"/><br />
        <p>Location</p>
        <asp:TextBox id="Location" runat="server"/><br>

        <table style="width: 100%;"> 
            <tr>                    
                <td>Videos Links:</td>                   
                <td>Photos Links:</td>              
                </tr>             
            <tr>                  
                <td><asp:TextBox id="TextBox1v" runat="server"/><br>             
                    <asp:TextBox id="TextBox2v" runat="server"/><br>               
                    <asp:TextBox id="TextBox3v" runat="server"/><br>                      
                    <asp:TextBox id="TextBox4v" runat="server"/><br>                         
                    <asp:TextBox id="TextBox5v" runat="server"/><br>                          
                    <asp:TextBox id="TextBox6v" runat="server"/><br></td>
                
                <td><asp:TextBox id="TextBox1p" runat="server"/><br>                             
                    <asp:TextBox id="TextBox2p" runat="server"/><br>                               
                    <asp:TextBox id="TextBox3p" runat="server"/><br>                               
                    <asp:TextBox id="TextBox4p" runat="server"/><br>                              
                    <asp:TextBox id="TextBox5p" runat="server"/><br>                            
                    <asp:TextBox id="TextBox6p" runat="server"/><br></td>                          
                <td></td>                    
                </tr>
        </table>
                   <asp:CheckBox ID="CheckBox1" runat="server" text="Create AD"/><br>
                   <asp:Button id="B1" runat="server" OnClick="createEvent" Text="Create Event"/><br />
                   <br>
                   <br>
                   <br>
                   <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" />
	</form>
        
        
   
</body>
</html>
