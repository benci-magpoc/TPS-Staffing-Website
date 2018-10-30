<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmAddStaff.aspx.cs" Inherits="frmAddStaff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 389px;
            text-align: right;
            font-weight: 700;
        }
        .auto-style3 {
            width: 389px;
            text-align: right;
            font-weight: bold;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            width: 389px;
            text-align: right;
            font-weight: bold;
            height: 28px;
        }
        .auto-style6 {
            text-align: left;
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="664px" HorizontalAlign="Center" Width="985px">
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
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Add Staff"></asp:Label>
            <br />
            <br />
            <table class="auto-style1" style="width: 80%; table-layout: inherit; z-index: 1; left: 251px; top: 308px; position: inherit; height: 355px; empty-cells: hide;">
                <tr>
                    <td class="auto-style2" style="padding-right: 10px">First Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtFirstName" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Last Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtLastName" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Phone Number:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtPhoneNumber" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Hire Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtHireDate" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Position</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtPosition" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Department</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtDepartment" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Address</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAddress" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5" style="padding-right: 10px">Zip Code</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtZipCode" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Profile Image</td>
                    <td class="auto-style4">
                        <asp:FileUpload ID="fileProfileImageLink" runat="server" Width="245px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">Resume</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtResume" runat="server" Width="241px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">&nbsp;</td>
                    <td class="auto-style4">
                        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-right: 10px">&nbsp;</td>
                    <td class="auto-style4">&nbsp;
                        <asp:Button ID="btnClear1" runat="server" Text="Clear" width="136px" />
                        &nbsp;
                        <asp:Button ID="btnSaveEmployee" runat="server" OnClick="btnSaveEmployee_Click" Text="Save Employee" />
                    </td>
                </tr>
            </table>
            <br />
            </asp:Panel>
    </div>
    </form>
</body>
</html>
