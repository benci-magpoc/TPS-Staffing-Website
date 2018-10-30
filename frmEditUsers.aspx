<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmEditUsers.aspx.cs" Inherits="frmEditUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            width: 470px;
        }
        .auto-style9 {
            text-align: left;
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
        .auto-style10 {
            height: 23px;
            width: 470px;
            text-align: right;
        }
        .auto-style3 {
            height: 23px;
            text-align: left;
        }
        .auto-style11 {
            width: 475px;
            text-align: right;
        }
        .auto-style7 {
            height: 34px;
            width: 475px;
        }
        .auto-style4 {
            height: 34px;
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
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" PostBackUrl="~/frmHome.aspx" />
            <br />
            <br />
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Strikeout="False" Text="Edit/Delete Users"></asp:Label>
            &nbsp;<br /> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TPS_Website_DBConnectionString1 %>" DeleteCommand="DELETE FROM [tblUsers] WHERE [UserID] = ?" InsertCommand="INSERT INTO [tblUsers] ([UserID], [ContractNumber], [UserPassword], [SecurityLevel]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:TPS_Website_DBConnectionString1.ProviderName %>" SelectCommand="SELECT * FROM [tblUsers]" UpdateCommand="UPDATE [tblUsers] SET [ContractNumber] = ?, [UserPassword] = ?, [SecurityLevel] = ? WHERE [UserID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="ContractNumber" Type="String" />
                    <asp:Parameter Name="UserPassword" Type="String" />
                    <asp:Parameter Name="SecurityLevel" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ContractNumber" Type="String" />
                    <asp:Parameter Name="UserPassword" Type="String" />
                    <asp:Parameter Name="SecurityLevel" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="ContractNumber" HeaderText="ContractNumber" SortExpression="ContractNumber" />
                    <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                    <asp:BoundField DataField="SecurityLevel" HeaderText="SecurityLevel" SortExpression="SecurityLevel" />
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
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
