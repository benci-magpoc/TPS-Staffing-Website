<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmSubmitRequest.aspx.cs" Inherits="frmSubmitRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            table-layout: auto;
            float: inherit;
        }
        .auto-style4 {
            height: 23px;
            width: 907px;
        }
        .auto-style5 {
            width: 907px;
        }
        .auto-style6 {
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
            <div class="auto-style6">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblEmployee] WHERE ([EmployeeID] = ?)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="EmployeeID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/frmRequestStaff.aspx">&lt;Back to Previous Page</asp:LinkButton>
                <br />
                <br />
                <asp:Button ID="btnSubmitRequest" runat="server" OnClick="btnSubmitRequest_Click" Text="Submit Request" />
                <br />
                <br />
            </div>
            <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="EmployeeID" DataSourceID="SqlDataSource2" GridLines="Both" HorizontalAlign="Center" Width="100%">
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    <table class="auto-style1" style="border: thin solid #800000; table-layout: auto; text-align: center; float: inherit;">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="FirstNameLabel" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("FirstName") %>' />
                                &nbsp;<asp:Label ID="LastNameLabel" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("LastName") %>' />
&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">EmployeeID:
                                <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                                <br />
                                PhoneNumber:
                                <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                                <br />
                                Experience:
                                <asp:Label ID="ExperienceLabel" runat="server" Text='<%# Eval("Experience") %>' />
                                <br />
                                PositionID:
                                <asp:Label ID="PositionIDLabel" runat="server" Text='<%# Eval("PositionID") %>' />
                                <br />
                                Salary:
                                <asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                                <br />
                                Address:
                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                <br />
                                Zipcode:
                                <asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                                <br />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
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
