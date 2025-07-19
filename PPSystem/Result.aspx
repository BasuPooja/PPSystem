<%@ Page Title="Result - Predictify" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="PPSystem.Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .result-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            text-align: center;
            font-family: 'Segoe UI', sans-serif;
        }
        .result-header {
            font-size: 24px;
            color: green;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .result-line {
            border-top: 1px solid #ccc;
            margin: 15px 0;
        }
        .result-item {
            font-size: 18px;
            margin: 5px 0;
            color: #333;
        }
        .result-buttons {
            margin-top: 25px;
        }
        .result-buttons button {
            background-color: #660033;
            color: white;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            font-size: 14pt;
            cursor: pointer;
        }
        .result-buttons button:hover {
            background-color: #99004d;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="result-container">
        <div class="result-header">✅ Test Submitted Successfully!</div>
        <div class="result-line"></div>
        <div class="result-item"><strong>Name:</strong> <asp:Label ID="lblName" runat="server"></asp:Label></div>
        <div class="result-item"><strong>UserID:</strong> <asp:Label ID="lblUserID" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Date:</strong> <asp:Label ID="lblDate" runat="server"></asp:Label></div>
        <div class="result-line"></div>
        <div class="result-item"><strong>Attempted Questions:</strong> <asp:Label ID="lblAttempted" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Missed Questions:</strong> <asp:Label ID="lblMissed" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Right Answers:</strong> <asp:Label ID="lblRight" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Wrong Answers:</strong> <asp:Label ID="lblWrong" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Marks Obtained:</strong> <asp:Label ID="lblMarks" runat="server"></asp:Label></div>
        <div class="result-item"><strong>Maximum Marks:</strong> 80</div>
        <div class="result-line"></div>

        <div class="result-buttons">
            <asp:Button ID="btnDownload" runat="server" Text="Download PDF" OnClick="btnDownload_Click" />
            <asp:Button ID="btnPrint" runat="server" Text="Print Result" OnClientClick="window.print();return false;" />
            <asp:Button ID="btnBack" runat="server" Text="Go Back" OnClick="btnBack_Click" />
        </div>
    </div>
</asp:Content>
