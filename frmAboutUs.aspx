<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAboutUs.aspx.cs" Inherits="frmAboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style4 {
            height: 23px;
            width: 907px;
        }
        .auto-style5 {
            width: 984px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style9 {
            text-align: left;
        }
        .auto-style22 {
            height: 21px;
            width: 984px;
            text-align: right;
        }
        .auto-style23 {
            height: 21px;
            text-align: left;
        }
        .auto-style3 {
            height: 23px;
            text-align: left;
        }
        .auto-style7 {
            height: 34px;
            width: 984px;
        }
        .auto-style25 {
            width: 474px;
            text-align: right;
        }
        .auto-style28 {
            height: 23px;
            width: 984px;
            text-align: right;
        }
        .auto-style29 {
            width: 984px;
            text-align: right;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 758px; margin-left: auto; margin-right: auto; margin-top: auto;">
    
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
            <div class="auto-style6">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Taylor's Professional Services is the major provider of staffing services in the USA. Please refer to the contact us link for opening an account with us." Width="60%"></asp:Label>
                <br />
            </div>
            <br />
            <br />
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
