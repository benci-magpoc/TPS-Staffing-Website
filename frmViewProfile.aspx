<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmViewProfile.aspx.cs" Inherits="frmViewProfile" %>

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
        .auto-style33 {
            width: 474px;
            text-align: right;
            height: 23px;
        }
        .auto-style36 {
            width: 477px;
            text-align: right;
        }
        .auto-style38 {
            text-align: right;
            width: 473px;
        }
        .auto-style39 {
            text-align: right;
            width: 473px;
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 758px; margin-left: auto; margin-right: auto; margin-top: auto;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="100%" HorizontalAlign="Center" Width="985px">
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
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblContractManager] WHERE ([UserID] = ?)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblEmployee] WHERE ([UserID] = ?)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="My Profile"></asp:Label>
                <br />
            </div>
            <br />
            <asp:DataList ID="DataList1" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="EmployeeID" GridLines="Both" OnCancelCommand="cancel" OnEditCommand="Edit" OnUpdateCommand="update" Width="100%" DataSourceID="SqlDataSource1">
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
                            <td class="auto-style25">&nbsp;</td>
                            <td class="auto-style9">
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtFirstName" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtLastName" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label4" runat="server" Text="Phone Number:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Eval("PhoneNumber") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone Number is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label5" runat="server" Text="Experience:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:DropDownList ID="ddlExperience" runat="server" height="22px" width="128px">
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
                            <td class="auto-style25">
                                <asp:Label ID="Label6" runat="server" Text="Position:"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtPosition" runat="server" Text='<%# Eval("PositionID") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPosition" ErrorMessage="Position is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label7" runat="server" Text="Salary:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtSalary" runat="server" Text='<%# Eval("Salary") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtSalary" ErrorMessage="Salary is required and should be a number value" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label8" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtAddress" runat="server" Text='<%# Eval("Address") %>' TextMode="MultiLine" Width="128px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address is required" ValidationGroup="EmployeeInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">
                                <asp:Label ID="Label9" runat="server" Text="Zipcode:"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtZipcode" runat="server" Text='<%# Eval("ZipCode") %>'></asp:TextBox>
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
                    <asp:Label ID="EmployeeIDLabel0" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    <br />
                    <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style22">FirstName:</td>
                            <td class="auto-style23">&nbsp;<asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28">LastName:</td>
                            <td class="auto-style3">&nbsp;<asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29">PhoneNumber: </td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29">Experience:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="ExperienceLabel" runat="server" Text='<%# Eval("Experience") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28">Position:</td>
                            <td class="auto-style3">&nbsp;<asp:Label ID="PositionIDLabel" runat="server" Text='<%# Eval("PositionID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29">Salary:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="SalaryLabel" runat="server" Text='<%# Eval("Salary") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style29">Address:</td>
                            <td class="auto-style9">&nbsp;<asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style28">Zipcode:</td>
                            <td class="auto-style3">&nbsp;<asp:Label ID="ZipcodeLabel" runat="server" Text='<%# Eval("Zipcode") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"></td>
                            <td class="auto-style4">&nbsp;&nbsp; </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" height="26px" width="55px" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblClient] WHERE ([UserID] = ?)" DeleteCommand="DELETE FROM [tblClient] WHERE [ClientID] = ?" InsertCommand="INSERT INTO [tblClient] ([ClientID], [ClientName], [CompanyName], [EmailAddress], [RequestID], [UserID], [ContractNumber], [StaffRequests]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [tblClient] SET [ClientName] = ?, [CompanyName] = ?, [EmailAddress] = ?, [RequestID] = ?, [UserID] = ?, [ContractNumber] = ?, [StaffRequests] = ? WHERE [ClientID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ClientID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ClientID" Type="Int32" />
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="EmailAddress" Type="String" />
                    <asp:Parameter Name="RequestID" Type="Int32" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="ContractNumber" Type="Int32" />
                    <asp:Parameter Name="StaffRequests" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ClientName" Type="String" />
                    <asp:Parameter Name="CompanyName" Type="String" />
                    <asp:Parameter Name="EmailAddress" Type="String" />
                    <asp:Parameter Name="RequestID" Type="Int32" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="ContractNumber" Type="Int32" />
                    <asp:Parameter Name="StaffRequests" Type="Int32" />
                    <asp:Parameter Name="ClientID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DataList ID="ClientDataList" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="ClientID" DataSourceID="SqlDataSource2" GridLines="Both" OnCancelCommand="Cancel" OnEditCommand="edit" OnUpdateCommand="Update" Width="100%">
                <EditItemTemplate>
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style25">Client ID: </td>
                            <td class="auto-style9">
                                <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style33">Name: </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtClientName" runat="server" Text='<%# Eval("ClientName") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">Company: </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtCompanyName" runat="server" Text='<%# Eval("CompanyName") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style25">Email Address: </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtEmailAddress" runat="server" Text='<%# Eval("EmailAddress") %>'></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;<asp:Button ID="Button6" runat="server" CommandName="Update" Text="Update" />
                    &nbsp;<asp:Button ID="Button7" runat="server" CommandName="Cancel" Text="Cancel" width="61px" />
                </EditItemTemplate>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style36">Client ID: </td>
                            <td class="auto-style3">
                                <asp:Label ID="ClientIDLabel" runat="server" Text='<%# Eval("ClientID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style36">Name: </td>
                            <td class="auto-style9">
                                <asp:Label ID="ClientNameLabel" runat="server" Text='<%# Eval("ClientName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style36">Company: </td>
                            <td class="auto-style9">
                                <asp:Label ID="CompanyNameLabel" runat="server" Text='<%# Eval("CompanyName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style36">Email Address: </td>
                            <td class="auto-style3">
                                <asp:Label ID="EmailAddressLabel" runat="server" Text='<%# Eval("EmailAddress") %>' />
                            </td>
                        </tr>
                    </table>
                    &nbsp;<br />
                    <asp:Button ID="Button5" runat="server" CommandName="edit" Text="Edit" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <asp:DataList ID="ManagerDataList" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyField="ContractManagerID" DataSourceID="SqlDataSource3" GridLines="Both" HorizontalAlign="Center" OnCancelCommand="canceL" OnEditCommand="ediT" OnUpdateCommand="updatE" Width="100%">
                <EditItemTemplate>
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style38">Client Manager ID: </td>
                            <td class="auto-style9">
                                <asp:Label ID="ContractManagerIDLabel" runat="server" Text='<%# Eval("ContractManagerID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style38">User ID: </td>
                            <td class="auto-style9">
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style38">Name: </td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtManagerName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style38">Email Address:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtManagerEmailAddress" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="Update" runat="server" CommandName="updatE" Text="Update" />
                    &nbsp;<asp:Button ID="Cancel" runat="server" CommandName="canceL" Text="Cancel" />
                </EditItemTemplate>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <ItemTemplate>
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style38">Client Manager ID: </td>
                            <td class="auto-style9">
                                <asp:Label ID="ContractManagerIDLabel" runat="server" Text='<%# Eval("ContractManagerID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style39">User ID: </td>
                            <td class="auto-style3">
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style38">Name: </td>
                            <td class="auto-style9">
                                <asp:Label ID="ManagerNameLabel" runat="server" Text='<%# Eval("ManagerName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style38">Email Address:</td>
                            <td class="auto-style9">
                                <asp:Label ID="EmailAddressLabel" runat="server" Text='<%# Eval("EmailAddress") %>' />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="Button8" runat="server" CommandName="ediT" Text="Edit" />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <br />
            <br />
            <br />
            <br />
        </asp:Panel>
    
        <br />
    
    </div>
    </form>
</body>
</html>
