<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmManageUsers.aspx.cs" Inherits="frmManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
            <br />
            <br />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="User Management"></asp:Label>
            <br />
            <br />
            &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="56px" ImageUrl="~/Images/AddUser.PNG" PostBackUrl="~/frmAddUser.aspx" ToolTip="Add User" Width="62px" />
            <br /> 
            <asp:LinkButton ID="lnkbtnAddUser" runat="server" ToolTip="Add User" PostBackUrl="~/frmAddUser.aspx">Add User</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnEditUsers" runat="server" ImageUrl="~/Images/EditStaff.PNG" PostBackUrl="~/frmEditUsers.aspx" />
            <br />
            <asp:LinkButton ID="lnkbtnEditUsers" runat="server" PostBackUrl="~/frmEditUsers.aspx">Edit/Delete Users</asp:LinkButton>
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
