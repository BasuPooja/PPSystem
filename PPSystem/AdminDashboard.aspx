<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="PPSystem.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 30px;
            margin: 40px auto;
            max-width: 95%;
        }

        .card {
            flex: 1 1 200px;
            background: linear-gradient(135deg, #ebb33d,#7a003b,#5473fa );
            color: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 6px 12px rgba(0,0,0,0.15);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .card-count {
            font-size: 48px;
            font-weight: bold;
        }

        .dashboard-heading {
            max-width: 80%;
            text-align: center;
            color: #CC0066;
            font-weight: bold;
            font-size: 42px;
            margin: 40px auto 20px auto;
            padding: 20px 30px;
            border-bottom: 6px solid #CC0066;
            border-radius: 15px;
            box-shadow: 0 6px 16px rgba(0,0,0,0.12);
            background: #8dc0fa;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1 class="dashboard-heading">Admin Dashboard</h1>

    <div class="dashboard-container">
        <div class="card">
            <div class="card-title">Total Applicants</div>
            <div class="card-count">
                <asp:Label ID="lblTotalApplicants" runat="server" Text="0"></asp:Label>
            </div>
        </div>

        <div class="card">
            <div class="card-title">Approved Applicants</div>
            <div class="card-count">
                <asp:Label ID="lblApprovedApplicants" runat="server" Text="0"></asp:Label>
            </div>
        </div>

        <div class="card">
            <div class="card-title">Shortlisted CVs</div>
            <div class="card-count">
                <asp:Label ID="lblShortlistedCVs" runat="server" Text="0"></asp:Label>
            </div>
        </div>

        <div class="card">
            <div class="card-title">Pending Applications</div>
            <div class="card-count">
                <asp:Label ID="lblPendingApplicants" runat="server" Text="0"></asp:Label>
            </div>
        </div>
    </div>

</asp:Content>
