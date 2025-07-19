using System;
using System.Data.SqlClient;

namespace PPSystem
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.NET\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDashboardCounts();
            }
        }

        private void LoadDashboardCounts()
        {
            try
            {
                con.Open();

                // Total Applicants
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM Applicant", con);
                lblTotalApplicants.Text = cmdTotal.ExecuteScalar().ToString();

                // Approved Applicants
                SqlCommand cmdApproved = new SqlCommand("SELECT COUNT(*) FROM Applicant WHERE Action_Status = 'Approved'", con);
                lblApprovedApplicants.Text = cmdApproved.ExecuteScalar().ToString();

                // Shortlisted CVs (same as Approved in your workflow)
                lblShortlistedCVs.Text = lblApprovedApplicants.Text;

                // Pending Applicants
                SqlCommand cmdPending = new SqlCommand("SELECT COUNT(*) FROM Applicant WHERE Action_Status IS NULL OR Action_Status = 'Pending'", con);
                lblPendingApplicants.Text = cmdPending.ExecuteScalar().ToString();

                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                Response.Write("<script>alert('Error loading dashboard counts: " + ex.Message + "');</script>");
            }
        }
    }
}
