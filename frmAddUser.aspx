<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAddUser.aspx.cs" Inherits="frmAddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="662px" HorizontalAlign="Center" Width="985px">
            <asp:Menu ID="Menu1" runat="server" Orientation ="Horizontal" BackColor="Silver" ForeColor="Black" Height="25px" Width="100%">
                <Items>
                    <asp:MenuItem Text = "Home" Value ="Home" NavigateUrl ="~/frmHome.aspx"> </asp:MenuItem>
                    <asp:MenuItem Text ="Contact Us" Value ="Contact Us" NavigateUrl ="~/frmContactUs.aspx"></asp:MenuItem> 
                    <asp:MenuItem Text ="About Us" Value ="About Us" NavigateUrl ="~/frmAboutUs.aspx"></asp:MenuItem>    
                    <asp:MenuItem Text ="Logout" Value ="Logout" NavigateUrl ="~/frmLogout.aspx"></asp:MenuItem>    
                </Items>
                <StaticHoverStyle Font-Bold="True" />
                <StaticMenuItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" />
            </asp:Menu>
            <div>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
                <br />
                <br />
                <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" style="" Text="Add User"></asp:Label>
                <br />
                <br />
                &nbsp;<asp:Label ID="Label1" runat="server" Height="50px" style="height: 22px; text-align: right; margin-left: 0px" Text="Contract Number: " width="120px"></asp:Label>
                &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtContractNumber" runat="server" height="22px" width="128px"></asp:TextBox>
&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblErrorContractNumber" runat="server"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label2" runat="server" style="text-align: right; margin-left: 0px" Text="User Password:" width="120px"></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtUserPassword" runat="server" height="22px" width="128px"></asp:TextBox>
&nbsp;
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblErrorUserPassword" runat="server"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Label ID="Label3" runat="server" style="text-align: right" Text="Security Level:" width="120px"></asp:Label>
                &nbsp;&nbsp;
                <asp:DropDownList ID="ddlSecurityLevel" runat="server" height="22px" width="128px">
                    <asp:ListItem Value="C">Client</asp:ListItem>
                    <asp:ListItem Value="A">Contract Manager</asp:ListItem>
                    <asp:ListItem Value="S">Staff</asp:ListItem>
                </asp:DropDownList>
&nbsp;<br />
                <br />
                <br />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" width="82px" OnClick="btnCancel_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnAddUser" runat="server" OnClick="btnAddUser_Click" Text="Add User" />
                <br />
                <br />
                <asp:Label ID="lblError" runat="server"></asp:Label>
                <br />
            </div>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
