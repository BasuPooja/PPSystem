<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="StartTest.aspx.cs" Inherits="PPSystem.StartTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .test-container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 75vh;
        }

        .test-card {
            background-color: #FFFFD9;;
            border: 2px solid #990033;
            border-radius: 10px;
            padding: 50px 30px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.15);
            max-width: 750px;
            width: 100%;
        }

        .test-title {
            font-size: 28px;
            font-weight: bold;
            color: #990033;
            margin-bottom: 15px;
        }

        .welcome-label {
            display: inline-block;
            background-color: #cc0066;
            color: white;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .test-button {
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
        }

        .test-button:hover {
            background-color: #0056b3;
        }

        .test-image {
            width: 80px;
            height: 80px;
            margin: 10px auto;
        }

        .hand-image {
            width: 150px;
            height: 150px;
            margin: 10px auto;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="test-container">
        <div class="test-card">
            
            <asp:Label ID="Label12" runat="server" CssClass="welcome-label" Text=""></asp:Label>

            <div class="test-title">Start Your Test</div>


            <div>
                <asp:Image ID="Image4" runat="server" CssClass="test-image" ImageUrl="~/Image/Start.png" />
            </div>

            <div>
                <asp:Image ID="Image3" runat="server" CssClass="hand-image" ImageUrl="~/Image/Hand.gif" />
            </div>

            <asp:Button ID="Submit" runat="server" CssClass="test-button" OnClick="Button1_Click" Text="Start Test" />
        </div>
    </div>
</asp:Content>
