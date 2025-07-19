<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="PPSystem.UserDashboard" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>User Dashboard - Predictify</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .dashboard-container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .welcome {
            font-size: 22pt;
            font-weight: bold;
            color: #99004d;
            text-align: center;
        }
        .info-panel {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 25px;
        }
        .card {
            flex: 1 1 45%;
            background-color: #fce5ec;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .card h4 {
            margin-top: 0;
            color: #990033;
        }
        .actions {
            margin-top: 30px;
            text-align: center;
        }
        .actions a, .actions button {
            margin: 10px;
            padding: 10px 20px;
            background-color: #cc0066;
            color: white;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 14pt;
            cursor: pointer;
        }
        .status-box {
            background-color: #fff0f5;
            border-left: 6px solid #990033;
            padding: 15px;
            margin-top: 25px;
        }
        .status-box p {
            margin: 5px 0;
            font-size: 12pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="dashboard-container">
            <div class="welcome">
                👋 Welcome, <asp:Label ID="lblUserName" runat="server" Text="User Name" />
            </div>

            <div class="info-panel">
                <div class="card">
                    <h4>Profile Summary</h4>
                    <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server" /></p>
                    <p><strong>Applied For:</strong> <asp:Label ID="lblAppliedFor" runat="server" /></p>
                    <p><strong>Gender:</strong> <asp:Label ID="lblGender" runat="server" /></p>
                </div>

                <div class="card">
                    <h4>Test & CV</h4>
                    <p><strong>Test Status:</strong> <asp:Label ID="lblTestStatus" runat="server" /></p>
                    <p><strong>CV Uploaded:</strong> <asp:Label ID="lblCVStatus" runat="server" /></p>
                    <p><strong>Match %:</strong> <asp:Label ID="lblMatchPercent" runat="server" /></p>
                </div>
            </div>

            <div class="actions">
                <asp:Button ID="btnStartTest" runat="server" Text="Start Test" OnClick="btnStartTest_Click" />
                <asp:Button ID="btnViewCV" runat="server" Text="View My CV" OnClick="btnViewCV_Click" />
                <asp:Button ID="btnViewResult" runat="server" Text="View Result" OnClick="btnViewResult_Click" />
                <asp:Button ID="btnEditProfile" runat="server" Text="Edit Profile" OnClick="btnEditProfile_Click" />
            </div>

            <div class="status-box">
                <p>📄 CV Status: <asp:Label ID="lblFinalStatus" runat="server" /></p>
                <p>🕐 Last Updated: <asp:Label ID="lblLastUpdated" runat="server" /></p>
            </div>
        </div>
    </form>
</body>
</html>
