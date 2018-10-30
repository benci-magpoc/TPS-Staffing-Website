<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmManageStaffing.aspx.cs" Inherits="frmManageStaffing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contract Manager Page</title>
    <style type="text/css">
        .auto-style1 {
            height: 758px;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            height: 23px;
            text-align: left;
        }
        .auto-style4 {
            height: 34px;
        }
        .auto-style5 {
            width: 470px;
        }
        .auto-style7 {
            height: 34px;
            width: 475px;
        }
        .auto-style9 {
            text-align: left;
        }
        .auto-style10 {
            height: 23px;
            width: 470px;
            text-align: right;
        }
        .auto-style11 {
            width: 475px;
            text-align: right;
        }
        .auto-style12 {
            width: 477px;
        }
        .auto-style13 {
            height: 23px;
            text-align: right;
            width: 477px;
        }
        .auto-style19 {
            width: 477px;
            text-align: right;
        }
        .auto-style20 {
            width: 477px;
            text-align: right;
            height: 26px;
        }
        .auto-style21 {
            text-align: left;
            height: 26px;
        }
        .auto-style22 {
            height: 21px;
            width: 470px;
            text-align: right;
        }
        .auto-style23 {
            height: 21px;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; " class="auto-style1">
    
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblEmployee] WHERE ([EmployeeID] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT [EmployeeID] FROM [tblEmployee]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Manage Employee ID:"></asp:Label>
            &nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="EmployeeID" DataValueField="EmployeeID">
                <asp:ListItem>0</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="EmployeeID" GridLines="Both" OnCancelCommand="cancel" OnDeleteCommand="delete" OnEditCommand="Edit" OnUpdateCommand="update" Width="100%" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    Employee ID:
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>'></asp:Label>
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                    <br />
                    <asp:FileUpload ID="fileProfileImageLink" runat="server" />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style12">
                                &nbsp;</td>
                            <td>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                            </td>
                            <td class="auto-style9"><asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style20">
                                <asp:Label ID="Label4" runat="server" Text="Phone Number:"></asp:Label>
                            </td>
                            <td class="auto-style21"><asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label5" runat="server" Text="Experience:"></asp:Label>
                            </td>
                            <td class="auto-style9"><asp:DropDownList ID="ddlExperience" runat="server" height="22px" width="128px">
                                <asp:ListItem>0 - 2 Years</asp:ListItem>
                                <asp:ListItem>2 - 5 Years</asp:ListItem>
                                <asp:ListItem>5 - 10 Years</asp:ListItem>
                                <asp:ListItem>10 - 15 Years</asp:ListItem>
                                <asp:ListItem>15 - 20 Years</asp:ListItem>
                                <asp:ListItem>20+ Years</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">
                                <asp:Label ID="Label6" runat="server" Text="Position:"></asp:Label>
                            </td>
                            <td class="auto-style3"><asp:TextBox ID="txtPosition" runat="server" Text='<%# Eval("PositionID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPosition" ErrorMessage="Position is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="Salary:"></asp:Label>
                            </td>
                            <td class="auto-style9"><asp:TextBox ID="txtSalary" runat="server" Text='<%# Eval("Salary") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary is required and should be a number value" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td class="auto-style9"><asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' TextMode="MultiLine" Width="128px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label9" runat="server" Text="Zipcode:"></asp:Label>
                            </td>
                            <td class="auto-style9"><asp:TextBox ID="txtZipcode" runat="server" Text='<%# Eval("ZipCode") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtZipcode" ErrorMessage="Zipcode is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="btnUpdate" runat="server" CommandName="update" Text="Update" ValidationGroup="EmployeeInfo" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="cancel" Text="Cancel" />
                    <br />
                </EditItemTemplate>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    EmployeeID:
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style5">
                                &nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style22">FirstName:</td>
                            <td class="auto-style23">
                                &nbsp;<asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">LastName:</td>
                            <td class="auto-style3">&nbsp;<asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">PhoneNumber:
                            </td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Experience:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="ExperienceLabel" runat="server" Text='<%# Eval("Experience") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Position:</td>
                            <td class="auto-style3">&nbsp;<asp:Label ID="PositionIDLabel" runat="server" Text='<%# Eval("PositionID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Salary:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Address:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style11">Zipcode:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                            </td>
                            <td class="auto-style4">&nbsp;&nbsp; </td>
                        </tr>
                    </table>
                    <asp:Button ID="btnDelete" runat="server" CommandName="delete" Text="Delete" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" height="26px" Text="Edit" width="55px" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            </asp:Panel>
    </div>
    </form>
</body>
</html>
