<%@ Page Title="Test Already Submitted - Predictify" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TestExistPage.aspx.cs" Inherits="PPSystem.TestExistPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .page-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            text-align: center;
        }

        .status-label {
            background-color: #cc0066;
            color: white;
            font-size: 24pt;
            font-weight: bold;
            padding: 15px 30px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .status-text {
            font-size: 22pt;
            font-weight: bold;
            color: #333;
            margin-top: 20px;
        }

        .status-images {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
        }

        .status-images img {
            max-width: 200px;
            height: auto;
        }

        .check-result-button {
            background-color: #0099FF;
            color: white;
            font-size: 16pt;
            font-weight: bold;
            border: none;
            padding: 12px 24px;
            border-radius: 6px;
            cursor: pointer;
        }

        .check-result-button:hover {
            background-color: #007acc;
        }

        @media (max-width: 600px) {
            .status-label {
                font-size: 18pt;
                padding: 10px 20px;
            }

            .status-text {
                font-size: 18pt;
            }

            .check-result-button {
                font-size: 14pt;
                padding: 10px 20px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page-container">
        <asp:Label ID="Label12" runat="server" CssClass="status-label" Text="KEERTHANA BABU"></asp:Label>

        <div class="status-images">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/Done.jpg" AlternateText="Done" />
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Image/Hand.gif" AlternateText="Hand" />
        </div>

        <asp:Label ID="Label23" runat="server" CssClass="status-text" Text="Test already submitted"></asp:Label>

        <br />
        <asp:Button ID="Submit1" runat="server" CssClass="check-result-button" Text="Check Result" OnClick="Button1_Click" />
    </div>
</asp:Content>
