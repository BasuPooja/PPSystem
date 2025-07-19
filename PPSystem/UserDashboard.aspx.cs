using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace PPSystem
{
    public partial class UserDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["PPSConnectionString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] != null)
            {
                string userID = Session["UserID"].ToString();
                LoadDashboard(userID);
            }
        }

        private void LoadDashboard(string userId)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Applicant WHERE UserID = @UserID", con);
            cmd.Parameters.AddWithValue("@UserID", userId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                lblUserName.Text = row["AName"].ToString();
                lblEmail.Text = row["AEmail"].ToString();
                lblAppliedFor.Text = row["Applying_for"].ToString();
                lblGender.Text = row["AGender"].ToString();
                lblCVStatus.Text = string.IsNullOrEmpty(row["CV"].ToString()) ? "Not Uploaded" : "Uploaded";
                lblFinalStatus.Text = row["Action_Status"].ToString();
                lblLastUpdated.Text = row["Action_Date_Time"] == DBNull.Value ? "N/A" : Convert.ToDateTime(row["Action_Date_Time"]).ToString("dd MMM yyyy hh:mm tt");

                // Optional logic for test status & match %
                lblTestStatus.Text = "Completed"; // or "Pending"
                lblMatchPercent.Text = "82%"; // You can fetch this from Result table or logic
            }
        }

        protected void btnStartTest_Click(object sender, EventArgs e)
        {
            Response.Redirect("Test.aspx");
        }

        protected void btnViewCV_Click(object sender, EventArgs e)
        {
            // Redirect to CV if exists
        }

        protected void btnViewResult_Click(object sender, EventArgs e)
        {
            Response.Redirect("Result.aspx");
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}
