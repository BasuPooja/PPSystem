<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ContectUs.aspx.cs" Inherits="PPSystem.ContectUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main-panel {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 20px;
            background-color: #f9f9f9;
            min-height: 100vh;
            gap: 40px;
            flex-wrap: wrap;
        }

        .form-container {
            background-color: #FFFFD9;
            border: 3px ridge #990033;
            padding: 25px;
            width: 400px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .form-container h2 {
            text-align: center;
            color: #990033;
            margin-bottom: 10px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .form-group label {
            font-weight: bold;
            font-size: 14pt;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group textarea {
            padding: 8px;
            font-size: 12pt;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-group textarea {
            resize: vertical;
            height: 100px;
        }

        .submit-button {
            align-self: center;
            background-color: #0099FF;
            color: white;
            font-size: 14pt;
            font-weight: bold;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover {
            background-color: #007ACC;
        }

        .validation-error {
            color: red;
            font-size: 10pt;
        }

        .right-image {
            max-width: 650px;
            width: 650px;
            height: auto;
/*            border: 3px ridge #990033;*/
/*            border-radius: 8px;*/
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-panel">
        <!-- Form Panel -->
        <div class="form-container">
            <h2>Contact Us</h2>

            <div class="form-group">
                <asp:Label ID="LabelName" runat="server" Text="Name:" />
                <asp:TextBox ID="TBName" runat="server" />
                <asp:RequiredFieldValidator ID="RFVName" runat="server" ControlToValidate="TBName"
                    ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="LabelEmail" runat="server" Text="Email:" />
                <asp:TextBox ID="TBEmail" runat="server" TextMode="Email" />
                <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TBEmail"
                    ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="REVEmail" runat="server" ControlToValidate="TBEmail"
                    ErrorMessage="* Invalid email" CssClass="validation-error" Display="Dynamic"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
            </div>

            <div class="form-group">
                <asp:Label ID="LabelContact" runat="server" Text="Contact No:" />
                <asp:TextBox ID="TBContact" runat="server" TextMode="Phone" />
                <asp:RequiredFieldValidator ID="RFVContact" runat="server" ControlToValidate="TBContact"
                    ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
                <asp:RegularExpressionValidator ID="REVContact" runat="server" ControlToValidate="TBContact"
                    ErrorMessage="* Enter 10-digit number" CssClass="validation-error" Display="Dynamic"
                    ValidationExpression="^\d{10}$" />
            </div>

            <div class="form-group">
                <asp:Label ID="LabelSubject" runat="server" Text="Subject:" />
                <asp:TextBox ID="TBSub" runat="server" />
                <asp:RequiredFieldValidator ID="RFVSubject" runat="server" ControlToValidate="TBSub"
                    ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="LabelMessage" runat="server" Text="Message:" />
                <asp:TextBox ID="TBMessage" runat="server" TextMode="MultiLine" Rows="4" />
                <asp:RequiredFieldValidator ID="RFVMessage" runat="server" ControlToValidate="TBMessage"
                    ErrorMessage="* Required" CssClass="validation-error" Display="Dynamic" />
            </div>

            <asp:Button ID="Send" runat="server" Text="Send your message" CssClass="submit-button"
                OnClick="Send_Click" />
        </div>

        <!-- Right Image -->
        <asp:Image ID="Image3" runat="server" CssClass="right-image" ImageUrl="~/Image/Contact.png" />
    </div>
</asp:Content>
