<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmRequestStaff.aspx.cs" Inherits="frmRequestStaff" %>

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblEmployee]"></asp:SqlDataSource>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Request Staff"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Search Staff According to: "></asp:Label>
            &nbsp;
            <asp:DropDownList ID="ddlSearch" runat="server">
                <asp:ListItem>ZipCode</asp:ListItem>
                <asp:ListItem Value="PositionID">Position</asp:ListItem>
                <asp:ListItem>Salary</asp:ListItem>
            </asp:DropDownList>
            &nbsp;
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            &nbsp;
            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_ItemCommand" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="View Profile">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<% # Eval("EmployeeID") %>' CommandName="viewProfile" Text="View Profile"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Profile Picture">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Experience" HeaderText="Experience" SortExpression="Experience" />
                    <asp:BoundField DataField="PositionID" HeaderText="Position" SortExpression="PositionID" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="EmployeeID" OnRowCommand="GridView1_ItemCommand" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="View Profile">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<% # Eval("EmployeeID") %>' CommandName="viewProfile" Text="View Profile"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Profile Picture">
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" Height="200px" ImageUrl='<%# Eval("ProfileImage") %>' Width="200px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="Experience" HeaderText="Experience" SortExpression="Experience" />
                    <asp:BoundField DataField="PositionID" HeaderText="Position" SortExpression="PositionID" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Zipcode" HeaderText="Zipcode" SortExpression="Zipcode" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
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
