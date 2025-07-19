using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class ShortList_Applicant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.NET\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobIDs();
                LoadShortlistedApplicants();
            }
        }

        private void LoadJobIDs()
        {
            try
            {
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT Applying_for FROM Applicant WHERE Action_Status = 'Approved'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DDLJobID.Items.Clear();
                DDLJobID.Items.Add("-- Select Job ID --");
                while (dr.Read())
                {
                    if (!string.IsNullOrEmpty(dr["Applying_for"].ToString()))
                    {
                        DDLJobID.Items.Add(dr["Applying_for"].ToString());
                    }
                }
                dr.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                con.Close();
                Response.Write("<script>alert('Error loading Job IDs: " + ex.Message + "');</script>");
            }
        }

        private void LoadShortlistedApplicants(string userIdFilter = "", string jobIdFilter = "")
        {
            try
            {
                string query = "SELECT UserID, Applying_for, AName, AEmail, AContact, AGender, DOB, Address, CV, Image, Action_Status, Action_Date_Time FROM Applicant WHERE Action_Status = 'Approved'";

                if (!string.IsNullOrWhiteSpace(userIdFilter))
                {
                    query += " AND UserID LIKE @UserID";
                }
                if (!string.IsNullOrWhiteSpace(jobIdFilter) && jobIdFilter != "-- Select Job ID --")
                {
                    query += " AND Applying_for = @JobID";
                }
                query += " ORDER BY Action_Date_Time DESC";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrWhiteSpace(userIdFilter))
                {
                    cmd.Parameters.AddWithValue("@UserID", "%" + userIdFilter + "%");
                }
                if (!string.IsNullOrWhiteSpace(jobIdFilter) && jobIdFilter != "-- Select Job ID --")
                {
                    cmd.Parameters.AddWithValue("@JobID", jobIdFilter);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridShortlisted.DataSource = dt;
                GridShortlisted.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error loading shortlisted applicants: " + ex.Message + "');</script>");
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            LoadShortlistedApplicants(TxtUserID.Text.Trim(), DDLJobID.SelectedValue);
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TxtUserID.Text = "";
            DDLJobID.SelectedIndex = 0;
            LoadShortlistedApplicants();
        }

        protected void GridShortlisted_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridShortlisted.PageIndex = e.NewPageIndex;
            LoadShortlistedApplicants(TxtUserID.Text.Trim(), DDLJobID.SelectedValue);
        }
    }
}
