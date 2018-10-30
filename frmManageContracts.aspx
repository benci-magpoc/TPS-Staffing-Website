<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmManageContracts.aspx.cs" Inherits="frmManageContracts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contract Manager Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="662px" HorizontalAlign="Center" Width="985px">
            <asp:Menu ID="Menu1" runat="server" Orientation ="Horizontal" BackColor="Silver" ForeColor="Black" Height="25px" Width="100%" OnMenuItemClick="Menu1_MenuItemClick">
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
            <asp:ImageButton ID="ImageButton2" runat="server" Height="60px" ImageUrl="~/Images/CreateContract.PNG" Width="60px" />
            <br />
            <asp:LinkButton ID="lnkbtnCreateContract" runat="server" ToolTip="Create Contract">Create Contract</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="ImageButton3" runat="server" Height="60px" ImageUrl="~/Images/ModifyContract.PNG" Width="60px" />
            <br />
            <asp:LinkButton ID="lnkbtnModifyContract" runat="server" ToolTip="Modify Contract">Modify Contract</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="ImageButton4" runat="server" Height="60px" ImageUrl="~/Images/DeleteContract.PNG" Width="60px" />
            <br />
            <asp:LinkButton ID="lnkbtnDeleteContract" runat="server" ToolTip="Delete Contract">Delete Contract</asp:LinkButton>
            <br />
            </asp:Panel>
    </div>
    </form>
</body>
</html>
