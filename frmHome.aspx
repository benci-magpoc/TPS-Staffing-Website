<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmHome.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TPS Home Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="750px" HorizontalAlign="Center" Width="985px">
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
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="Welcome"></asp:Label>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnStaffProfile" runat="server" Height="56px" ImageUrl="~/Images/StaffProfile.PNG" Width="62px" CommandName="viewProfile" OnClick="imgbtnStaffProfile_Click" />
            &nbsp;<br /> <asp:LinkButton ID="lnkbtnStaffProfile" runat="server" CssClass="static" Font-Size="Large" ToolTip="Manage Contracts" Height="0px" CommandName="viewProfile" OnClick="lnkbtnStaffProfile_Click" >View Profile</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnStaffRequest" runat="server" height="56px" ImageUrl="~/Images/RequestStaff.PNG" width="62px" PostBackUrl="~/frmRequestStaff.aspx" />
            &nbsp;<br />
            <asp:LinkButton ID="lnkbtnStaffRequest" runat="server" Font-Size="Large" PostBackUrl="~/frmRequestStaff.aspx">Create Staff Request</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnRequestStatus" runat="server" height="56px" ImageUrl="~/Images/ViewRequestStatus.PNG" width="62px" OnClick="imgbtnRequestStatus_Click" />
            <br />
            &nbsp;<asp:LinkButton ID="lnkbtnRequestStatus" runat="server" Font-Size="Large" OnClick="lnkbtnRequestStatus_Click">View Request Status</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnManageStaffing" runat="server" height="56px" ImageUrl="~/Images/Staffing.PNG" PostBackUrl="~/frmManageStaffing.aspx" width="62px" />
            <br />
            <asp:LinkButton ID="lnkbtnManageStaffing" runat="server" Font-Size="Large" PostBackUrl="~/frmManageStaffing.aspx" ToolTip="Manage Staffing">Manage Staffing</asp:LinkButton>
            <br />
            <br />
            <asp:ImageButton ID="imgbtnManageUsers" runat="server" height="56px" ImageUrl="~/Images/Users.PNG" PostBackUrl="~/frmManageUsers.aspx" width="62px" />
            <br />
            <asp:LinkButton ID="lnkbtnManageUsers" runat="server" Font-Size="Large" PostBackUrl="~/frmManageUsers.aspx" ToolTip="Manage Users">Manage Users</asp:LinkButton>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
