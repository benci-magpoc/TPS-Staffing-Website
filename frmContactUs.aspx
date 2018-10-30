<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 637px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style9 {
            text-align: right;
            width: 490px;
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
            <div class="auto-style1" style="margin-right: 0px; margin-left: 0px">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text="To open your account, please enter your information below. One of our customer specialists will contact you as soon as possible to assist you in opening a new contract with us. Please complete the form below and we would be more than happy to contact you." Width="60%"></asp:Label>
                <br />
                <br />
                &nbsp;<br />
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style9">Company Name:&nbsp;&nbsp; </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtCompanyName" runat="server" Width="208px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Your Name:&nbsp;&nbsp; </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtName" runat="server" width="208px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Your Phone Number:&nbsp;&nbsp; </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtPhoneNumber" runat="server" width="208px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">Email Address:&nbsp;&nbsp; </td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtEmail" runat="server" width="208px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="2">
                            <br />
                            <asp:Button ID="Button1" runat="server" height="26px" Text="Clear" width="61px" OnClick="Button1_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
