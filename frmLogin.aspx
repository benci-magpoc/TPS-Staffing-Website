<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmLogin.aspx.cs" Inherits="frmLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>TPS Login</title>
    <style type="text/css">
        .newStyle1 {
            background-color: #C0C0C0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: auto; height: 758px;">
    
        <asp:Panel ID="Panel1" runat="server" Style ="margin: 0 auto" Height="638px" HorizontalAlign="Center" Width="985px">
            <asp:Menu ID="Menu1" runat="server" Orientation ="Horizontal" BackColor="Silver" ForeColor="Black" Height="25px" Width="100%">
                <Items>
                    <asp:MenuItem Text = "Home" Value ="Home" NavigateUrl ="~/frmHome.aspx"> </asp:MenuItem>
                    <asp:MenuItem Text ="Contact Us" Value ="Contact Us" NavigateUrl ="~/frmContactUs.aspx"></asp:MenuItem> 
                    <asp:MenuItem Text ="About Us" Value ="About Us" NavigateUrl ="~/frmAboutUs.aspx"></asp:MenuItem>    
                    <asp:MenuItem Text ="Login" Value ="Login" NavigateUrl ="~/frmLogin.aspx"></asp:MenuItem>    
                </Items>
                <StaticHoverStyle Font-Bold="True" />
                <StaticMenuItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" />
            </asp:Menu>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/TPS.png" />
            <br />
            <br />
            <br />
                <asp:Login style="margin-left: auto; margin-right: auto" ID="Login1" runat="server" Height="120px" TitleText="TPS Login" UserNameLabelText="Contract Number:" Width="420px" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/frmHome.aspx" Font-Names="Verdana" Font-Size="Small" ForeColor="#333333" OnAuthenticate="Login1_Authenticate" TextLayout="TextOnTop" UserNameRequiredErrorMessage="Contract Number is required">
                    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                    <FailureTextStyle Font-Bold="True" />
                    <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Names="Verdana" Font-Size="Larger" ForeColor="#990000" />
                    <TextBoxStyle Font-Size="Larger" />
                    <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="Large" ForeColor="White" />
                </asp:Login>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
