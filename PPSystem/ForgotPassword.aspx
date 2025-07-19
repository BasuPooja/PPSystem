<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="PPSystem.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style61 { position: absolute; left: 451px; top: 409px; width: 457px; height: 437px; }
        .auto-style32 { position: absolute; left: 352px; top: 325px; width: 316px; font-size: xx-small; height: 46px; }
        .auto-style29 { position: absolute; left: 539px; top: 787px; width: 281px; height: 40px; }
        .auto-style30 { position: absolute; left: 534px; top: 513px; width: 70px; }
        .auto-style21 { position: absolute; left: 532px; top: 542px; width: 275px; height: 25px; }
        .auto-style66 { position: absolute; left: 537px; top: 602px; width: 291px; height: 25px; }
        .auto-style65 { position: absolute; left: 534px; top: 574px; width: 59px; }
        .auto-style40 { position: absolute; left: 534px; top: 666px; width: 275px; height: 25px; }
        .auto-style41 { position: absolute; left: 534px; top: 636px; width: 134px; }
        .auto-style43 { position: absolute; left: 536px; top: 737px; width: 275px; height: 25px; }
        .auto-style42 { position: absolute; left: 536px; top: 703px; width: 211px; }
        .auto-style58 { position: absolute; left: 607px; top: 520px; width: 38px; }
        .auto-style64 { position: absolute; left: 599px; top: 581px; width: 38px; }
        .auto-style53 { position: absolute; left: 669px; top: 642px; width: 43px; }
        .auto-style59 { position: absolute; left: 749px; top: 706px; width: 43px; }
        .auto-style56 { position: absolute; left: 749px; top: 707px; width: 76px; }
        .auto-style67 { position: absolute; left: 452px; top: 410px; width: 456px; height: 85px; }
        .auto-style34 { position: absolute; left: 1019px; top: 333px; width: 667px; height: 607px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderStyle="Inset" Height="775px" Width="1466px">
        
        <!-- Inner panel for form -->
        <asp:Panel ID="Panel2" runat="server" BackColor="#FFFFD9" CssClass="auto-style61" BorderColor="#990033" BorderStyle="Ridge">
        </asp:Panel>

        <!-- Save Button -->
        <asp:Button ID="Submit" runat="server" CssClass="auto-style29" Font-Bold="True" Font-Size="15pt"
            OnClick="Submit_Click" Text="Save Change" BackColor="#0099FF" />

        <!-- UserID -->
        <asp:Label ID="Label21" runat="server" CssClass="auto-style30" Font-Bold="True" Font-Size="15pt" Text="UserID:" />
        <asp:TextBox ID="TBUID" runat="server" CssClass="auto-style21" EnableTheming="True" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TBUID" CssClass="auto-style58" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />

        <!-- Email -->
        <asp:Label ID="Label18" runat="server" CssClass="auto-style65" Font-Bold="True" Font-Size="15pt" Text="Email:" />
        <asp:TextBox ID="TBEmail" runat="server" CssClass="auto-style66" EnableTheming="True" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TBEmail" CssClass="auto-style64" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />

        <!-- New Password -->
        <asp:Label ID="Label20" runat="server" CssClass="auto-style41" Font-Bold="True" Font-Size="15pt" Text="New Password:" />
        <asp:TextBox ID="TBNpass" runat="server" CssClass="auto-style40" EnableTheming="True" TextMode="Password" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TBNpass" CssClass="auto-style53" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />

        <!-- Confirm New Password -->
        <asp:Label ID="Label19" runat="server" CssClass="auto-style42" Font-Bold="True" Font-Size="15pt" Text="Confirm New Password:" />
        <asp:TextBox ID="TBCNPass" runat="server" CssClass="auto-style43" EnableTheming="True" TextMode="Password" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TBCNPass" CssClass="auto-style59" ErrorMessage="*" Font-Size="10pt" ForeColor="Red" />
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TBNpass" ControlToValidate="TBCNPass" CssClass="auto-style56" ErrorMessage="* Not Match" Font-Size="10pt" ForeColor="Red" />

        <!-- Images -->
        <asp:Image ID="Image3" runat="server" CssClass="auto-style34" ImageUrl="~/Image/Foggotpswd.jpg" />
        <asp:Image ID="Image4" runat="server" CssClass="auto-style67" BorderColor="#990033" BorderStyle="Solid" ImageUrl="~/Image/Forgot.png" />

    </asp:Panel>
</asp:Content>
