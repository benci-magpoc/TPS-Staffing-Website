<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmViewRequestStatus.aspx.cs" Inherits="frmViewRequestStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="Staff Request Status"></asp:Label>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblStaffRequest]" DeleteCommand="DELETE FROM [tblStaffRequest] WHERE [RequestID] = ?" InsertCommand="INSERT INTO [tblStaffRequest] ([RequestID], [EmployeeID], [UserID], [Status], [RequestDate], [EmployeeName], [RequestorName]) VALUES (?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [tblStaffRequest] SET [EmployeeID] = ?, [UserID] = ?, [Status] = ?, [RequestDate] = ?, [EmployeeName] = ?, [RequestorName] = ? WHERE [RequestID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="RequestID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="RequestID" Type="Int32" />
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="RequestDate" Type="DateTime" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="RequestorName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EmployeeID" Type="Int32" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="RequestDate" Type="DateTime" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="RequestorName" Type="String" />
                    <asp:Parameter Name="RequestID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT DISTINCT [Status] FROM [tblStaffRequest]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblStaffRequest] WHERE ([UserID] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="UserID" QueryStringField="ID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="RequestID" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:BoundField DataField="RequestID" HeaderText="RequestID" ReadOnly="True" SortExpression="RequestID" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" ReadOnly="True" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="RequestorName" HeaderText="RequestorName" ReadOnly="True" SortExpression="RequestorName" />
                    <asp:TemplateField HeaderText="Status">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="Status" SelectedValue='<%# Bind("Status") %>'>
                                <asp:ListItem>Approved</asp:ListItem>
                                <asp:ListItem>Reject</asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="RequestDate" HeaderText="RequestDate" ReadOnly="True" SortExpression="RequestDate" />
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
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="RequestID" DataSourceID="SqlDataSource3" Width="100%">
                <Columns>
                    <asp:BoundField DataField="RequestID" HeaderText="RequestID" InsertVisible="False" ReadOnly="True" SortExpression="RequestID" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" SortExpression="EmployeeName" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />
                    <asp:BoundField DataField="RequestorName" HeaderText="RequestorName" SortExpression="RequestorName" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:BoundField DataField="RequestDate" HeaderText="RequestDate" SortExpression="RequestDate" />
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
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
