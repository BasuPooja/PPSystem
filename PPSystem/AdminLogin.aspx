<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="PPSystem.AdminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .login-container {
            flex: 1 1 350px;
            max-width: 450px;
            background-color: #FFFFD9;
            border: 2px ridge #990033;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .login-container label {
            font-weight: bold;
            font-size: 14pt;
            margin-bottom: 5px;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            padding: 8px;
            font-size: 12pt;
        }

        .submit-button {
            padding: 10px;
            font-size: 14pt;
            font-weight: bold;
            background-color: #0099FF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            align-self: center;
            width: 150px;
        }

        .submit-button:hover {
            background-color: #007acc;
        }

        .heading-image {
            display: block;
            margin: 0 auto 15px auto;
            border: 2px solid #990033;
            max-width: 100%;
            height: auto;
        }

        .right-image {
            flex: 1 1 500px;
            max-width: 600px;
            height: auto;
/*            border: 3px solid #990033;*/
        }

        .validator {
            color: red;
            font-size: 10pt;
        }

        @media screen and (max-width: 992px) {
            .right-image {
                flex: 1 1 100%;
                max-width: 100%;
                margin-top: 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White">

        <div class="page-container">

            <!-- Login Form Panel -->
            <asp:Panel ID="Panel2" runat="server" CssClass="login-container">

                <!-- Heading Image -->
                <asp:Image ID="ImageHeading" runat="server" CssClass="heading-image" ImageUrl="~/Image/1.png" />

                <label>User ID:</label>
                <asp:TextBox ID="TBUID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="TBUID"
                    CssClass="validator"
                    ErrorMessage="*"
                    Display="Dynamic"></asp:RequiredFieldValidator>

                <label>Password:</label>
                <asp:TextBox ID="TBPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="TBPass"
                    CssClass="validator"
                    ErrorMessage="*"
                    Display="Dynamic"></asp:RequiredFieldValidator>

                <asp:Button ID="Submit" runat="server" Text="Submit" CssClass="submit-button" OnClick="Button1_Click" />

            </asp:Panel>

            <!-- Right-side image -->
            <asp:Image ID="ImageRight" runat="server" CssClass="right-image" ImageUrl="~/Image/l4.jpg" />

        </div>
    </asp:Panel>
</asp:Content>
