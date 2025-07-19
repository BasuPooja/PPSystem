<%@ Page Title="" Language="C#" Async="true" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PreferedCV.aspx.cs" Inherits="PPSystem.PreferedCV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .page-container {
            display: flex;
            align-items: flex-start;
            justify-content: center;
            flex-wrap: wrap;
            gap: 40px;
            padding: 20px;
        }
        .form-container {
            flex: 1 1 400px;
            max-width: 600px;
            background-color: #FFFFD9;
            border: 2px inset #990033;
            padding: 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.08);
        }
        .form-container img {
            width: 100%;
            height: 150px;
            border: 1px solid #990033;
        }
        .form-group {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .form-group label {
            width: 150px;
            font-weight: bold;
            font-size: 14pt;
            color: #990033;
        }
        .form-group input[type="text"],
        .form-group select {
            flex: 1;
            padding: 8px;
            font-size: 12pt;
            border-radius: 4px;
        }
        .submit-button {
            align-self: center;
            padding: 10px 20px;
            font-size: 14pt;
            font-weight: bold;
            background-color: #0099FF;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .submit-button:hover {
            background-color: #007acc;
        }
        .right-panel {
            flex: 1 1 350px;
            max-width: 400px;
            padding: 15px;
            background-color: #FFFFD9;
            border: 2px solid #CC0066;
            border-radius: 6px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        .table {
            border-collapse: collapse;
            width: 100%;
            font-size: 12pt;
            background-color: #fffcce;
            border-radius: 6px;
            overflow: hidden;
        }
        .table th, .table td {
            border: 1px solid #fcf9d8;
            padding: 8px;
            text-align: center;
        }
        .table th {
            background-color: #CC0066;
            font-weight: bold;
        }
        .table tr:nth-child(even) {
            background-color: #dfdba3;
        }
        .btn-success, .btn-danger {
            border: none;
            color: white;
            padding: 5px 12px;
            font-size: 10pt;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-success:hover {
            background-color: #218838;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .skill-textbox {
            margin-top: 10px;
            padding: 10px;
            font-size: 12pt;
            border: 1px solid #990033;
            border-radius: 5px;
            background-color: #fffff0;
            width: 100%;
        }
        .table-scroll {
            max-height: 500px;
            overflow-y: auto;
            border: 1px solid #ccc;
        }
        .skill-label {
            display: block;
            text-align: center;
            font-weight: bold;
            font-size: 16pt;
            padding: 10px 0;
            color: #660033;
        }
        .skill-output-panel {
            margin: 0 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderStyle="Inset">
        <div class="page-container">

            <!-- Left Form Panel -->
            <asp:Panel ID="Panel2" runat="server" CssClass="form-container">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Image/Preferred.png" AlternateText="Preferred CV Panel" />

                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Job ID:" AssociatedControlID="TBJID" />
                    <asp:DropDownList ID="TBJID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="TBJID_SelectedIndexChanged" Width="100%" />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Salary:" AssociatedControlID="TBSalary" />
                    <asp:TextBox ID="TBSalary" runat="server" Enabled="False" Width="100%" />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label10" runat="server" Text="Designation:" AssociatedControlID="TBDesignation" />
                    <asp:TextBox ID="TBDesignation" runat="server" Enabled="False" Width="100%" />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label11" runat="server" Text="Location:" AssociatedControlID="TBLocation" />
                    <asp:TextBox ID="TBLocation" runat="server" Enabled="False" Width="100%" />
                </div>

                <asp:Button ID="Submit" runat="server" Text="Scan" CssClass="submit-button" OnClick="Button1_Click" />
            </asp:Panel>

            <!-- Right Panel: Applicant List -->
            <asp:Panel ID="PanelApplicantList" runat="server" CssClass="right-panel" Visible="false">
                <asp:Label ID="LabelApplicantsTitle" runat="server" CssClass="skill-label" Text="Applicants for Selected Job" />
                <div class="table-scroll">
                    <asp:GridView ID="GridApplicantList" runat="server" AutoGenerateColumns="False" CssClass="table" Width="100%" role="table">
                        <Columns>
                            <asp:BoundField HeaderText="User ID" DataField="UserID" />
                            <asp:BoundField HeaderText="Name" DataField="AName" />
                        </Columns>
                    </asp:GridView>
                </div>
            </asp:Panel>

            <!-- Output Panel: Skill Match Report -->
            <asp:Panel ID="PanelSkillsOutput" runat="server" CssClass="skill-output-panel">
                <asp:Label ID="LabelSkillsTitle" runat="server" CssClass="skill-label" Text="CV Skill Match Report" />
                <div class="table-scroll">
                    <asp:GridView ID="CVMatchGrid" runat="server" AutoGenerateColumns="False"
                        CssClass="table" Width="100%" DataKeyNames="UserID"
                        OnRowCommand="CVMatchGrid_RowCommand" role="table">
                        <Columns>
                            <asp:BoundField HeaderText="User ID" DataField="UserID" />
                            <asp:BoundField HeaderText="Name" DataField="AName" />
                            <asp:BoundField HeaderText="CV Name" DataField="CVName" />
                            <asp:TemplateField HeaderText="Experience">
                                <ItemTemplate>
                                    <div>
                                        <strong>Part:</strong> <%# Eval("PartExperience") %><br />
                                        <strong>Required:</strong> <%# Eval("RequiredExperience") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Matched Skills" DataField="MatchedSkills" />
                            <asp:BoundField HeaderText="Total Matched Skills" DataField="TotalMatchedSkills" />
                            <asp:BoundField HeaderText="Obtained Marks" DataField="ObtainedMarks" />
                            <asp:BoundField HeaderText="Match %" DataField="MatchPercent" />
                            <asp:BoundField HeaderText="Final Status" DataField="FinalStatus" />
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Action_Status") %>'
                                        CssClass='<%# GetStatusCss(Eval("Action_Status").ToString()) %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Admin Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnApprove" runat="server" Height="35px" Text="Approve"
                                        CommandName="Approve" CommandArgument='<%# Eval("UserID") %>'
                                        CssClass="btn btn-success btn-sm"
                                        Enabled='<%# Eval("Action_Status").ToString() == "Pending" %>' />
                                    <asp:Button ID="btnReject" runat="server" Height="35px" Text="Reject"
                                        CommandName="Reject" CommandArgument='<%# Eval("UserID") %>'
                                        CssClass="btn btn-danger btn-sm"
                                        Enabled='<%# Eval("Action_Status").ToString() == "Pending" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <asp:TextBox ID="LabelSkills" runat="server" CssClass="skill-textbox" TextMode="MultiLine" ReadOnly="True" Width="100%" />
            </asp:Panel>
        </div>
    </asp:Panel>
</asp:Content>
