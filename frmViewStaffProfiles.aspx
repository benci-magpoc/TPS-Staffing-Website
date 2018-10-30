<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmViewStaffProfiles.aspx.cs" Inherits="frmViewStaffProfiles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contract Manager Page</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            top: auto;
            table-layout: inherit;
            height: 200px;
        }
        .auto-style4 {
            width: 250px;
            height: 200px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto; text-align: left;" Height="662px" HorizontalAlign="Center" Width="985px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSource1" GridLines="Both" style="text-align: center; margin-right: 178px" Width="796px">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    &nbsp;<table class="auto-style1" style="border: medium solid #996600; table-layout: fixed">
                        <tr>
                            <td class="auto-style4" style="border: medium solid #996600;">
                                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                            </td>
                            <td class="auto-style3" style="border: medium solid #996600; font-family: Arial, Helvetica, sans-serif; font-size: large; clip: rect(50px, auto, auto, auto); text-align: justify; vertical-align: top; text-indent: 20px;">
                                <br />
                                &nbsp;
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                &nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                <br />
                                <br />
                                &nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                                <br />
                                <br />
                                &nbsp;
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                &nbsp;&nbsp;
                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("Zipcode") %>'></asp:Label>
                                <br />
                                <br />
                                &nbsp;
                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("DepartmentID") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT [FirstName], [LastName], [PhoneNumber], [Zipcode], [ProfileImage], [Address], [DepartmentID] FROM [tblEmployee]"></asp:SqlDataSource>
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
