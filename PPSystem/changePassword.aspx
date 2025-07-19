<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="changePassword.aspx.cs" Inherits="PPSystem.changePassword" %>

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

        .form-container {
            flex: 1 1 350px;
            max-width: 500px;
            background-color: #FFFFD9;
            border: 2px ridge #990033;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .form-container label {
            font-weight: bold;
            font-size: 14pt;
            margin-bottom: 5px;
        }

        .form-container input[type="password"],
        .form-container input[type="text"] {
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
            width: 200px;
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
            border: 3px solid #990033;
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

            <!-- Form Panel -->
            <asp:Panel ID="Panel2" runat="server" CssClass="form-container">

                <!-- Heading Image -->
                <asp:Image ID="ImageHeading" runat="server" CssClass="heading-image" ImageUrl="~/Image/ChangePSW.png" />

                <label>Old Password:</label>
                <asp:TextBox ID="TBPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="TBPass"
                    CssClass="validator"
                    ErrorMessage="*"
                    Display="Dynamic"></asp:RequiredFieldValidator>

                <label>New Password:</label>
                <asp:TextBox ID="TBNpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="TBNpass"
                    CssClass="validator"
                    ErrorMessage="*"
                    Display="Dynamic"></asp:RequiredFieldValidator>

                <label>Confirm New Password:</label>
                <asp:TextBox ID="TBCNPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                    ControlToValidate="TBCNPass"
                    CssClass="validator"
                    ErrorMessage="*"
                    Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator2" runat="server"
                    ControlToValidate="TBCNPass"
                    ControlToCompare="TBNpass"
                    CssClass="validator"
                    ErrorMessage="* Passwords do not match"
                    Display="Dynamic"></asp:CompareValidator>

                <asp:Button ID="Submit" runat="server" Text="Change Password" CssClass="submit-button" OnClick="Button1_Click" />

            </asp:Panel>

            <!-- Right-side Image -->
            <asp:Image ID="ImageRight" runat="server" CssClass="right-image" ImageUrl="~/Image/Chngpswd.jpg" />

        </div>
    </asp:Panel>
</asp:Content>
