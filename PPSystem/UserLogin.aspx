<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="PPSystem.UserLogin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="display: flex; justify-content: center; align-items: center; width: 100%; margin-top: 50px;">
        <asp:Panel ID="Panel1" runat="server" Width="450px" BackColor="#FFFFD9" BorderStyle="Inset" BorderWidth="3px" BorderColor="#990033" style="padding: 30px; position: relative;">
            
            <div style="text-align: center; margin-bottom: 20px;">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/2.png" Width="450px" Height="100px" BorderStyle="Solid" BorderColor="#990033" />
            </div>

            <asp:Label ID="Label5" runat="server" Text="User ID:" Font-Bold="True" Font-Size="13pt" />
            <br />
            <asp:TextBox ID="TBUID" runat="server" Width="100%" Height="30px" Font-Size="12pt" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TBUID" ErrorMessage="*" ForeColor="Red" Font-Size="10pt" />
            <br /><br />

            <asp:Label ID="Label15" runat="server" Text="Password:" Font-Bold="True" Font-Size="13pt" />
            <br />
            <asp:TextBox ID="TBPass" runat="server" TextMode="Password" Width="100%" Height="30px" Font-Size="12pt" />
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TBPass" ErrorMessage="*" ForeColor="Red" Font-Size="10pt" />
            <br /><br />

            <asp:CheckBox ID="CheckBox1" runat="server" Text=" Show Password" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="true" />
            <br /><br />

            <asp:Button ID="Submit" runat="server" Text="Login" BackColor="#0099FF" ForeColor="White" Font-Bold="True" Font-Size="13pt" Width="100px" Height="50px" OnClick="Button1_Click" />
            <br /><br />
          
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="ForgotPassword.aspx" ForeColor="Red" style="margin-right: 20px;">Forgot Password?</asp:HyperLink>
            <br /> <br />
            <asp:Label ID="Label19" runat="server" Text="New user?" Font-Size="11pt" />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="UserRegistration.aspx" ForeColor="#3366FF" Font-Bold="True"> Register</asp:HyperLink>

        </asp:Panel>

        <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/l5.jpg" Width="500px" Height="500px" Style="margin-left: 50px; " />
    </div>

</asp:Content>
