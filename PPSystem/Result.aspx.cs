using System;
using System.Configuration;
using System.Data.SqlClient;

namespace PPSystem
{
    public partial class Result : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblName.Text = Session["Name"]?.ToString() ?? "N/A";
                lblUserID.Text = Session["id"]?.ToString() ?? "N/A";
                lblDate.Text = DateTime.Now.ToString("dd MMMM yyyy, hh:mm tt");

                string userId = Session["id"]?.ToString();
                if (!string.IsNullOrEmpty(userId))
                {
                    using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True"))
                    {
                        using (SqlCommand cmd = new SqlCommand("SELECT AttemptedQstn, MissedQuestion, RightAnswer, WrongAnswer, ObtainedMarks FROM Result WHERE UserID = @UserID", con))
                        {
                            cmd.Parameters.AddWithValue("@UserID", userId);
                            con.Open();
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    lblAttempted.Text = reader["AttemptedQstn"].ToString();
                                    lblMissed.Text = reader["MissedQuestion"].ToString();
                                    lblRight.Text = reader["RightAnswer"].ToString();
                                    lblWrong.Text = reader["WrongAnswer"].ToString();
                                    lblMarks.Text = reader["ObtainedMarks"].ToString();
                                }
                                else
                                {
                                    lblAttempted.Text = "0";
                                    lblMissed.Text = "0";
                                    lblRight.Text = "0";
                                    lblWrong.Text = "0";
                                    lblMarks.Text = "0";
                                }
                            }
                        }
                    }
                }
            }
        }


        protected void btnDownload_Click(object sender, EventArgs e)
        {
            // You can add your PDF download logic here.
            Response.Write("<script>alert('Download PDF functionality will be implemented.');</script>");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("About.aspx"); // or "Dashboard.aspx" if needed
        }
    }
}
