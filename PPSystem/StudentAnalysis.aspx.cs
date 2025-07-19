using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class StudentAnalysis : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userID = Request.QueryString["UserID"];
                if (!string.IsNullOrEmpty(userID))
                {
                    LoadStudentData(userID);
                    LoadStudentChart(userID);
                }
                else
                {
                    StudentInfo.InnerText = "Invalid UserID.";
                }
            }
        }

        private void LoadStudentData(string userID)
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM Result WHERE UserID = @UserID ORDER BY Timestamp", con))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            GridStudentResults.DataSource = dt;
            GridStudentResults.DataBind();

            if (dt.Rows.Count > 0)
            {
                StudentInfo.InnerText = $"Student Analysis: {dt.Rows[0]["UserName"]} ({dt.Rows[0]["UserID"]})";
            }
            else
            {
                StudentInfo.InnerText = "No records found for this user.";
            }
        }

        private void LoadStudentChart(string userID)
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand("SELECT Timestamp, ObtainedMarks FROM Result WHERE UserID = @UserID ORDER BY Timestamp", con))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            string[] dates = new string[dt.Rows.Count];
            int[] marks = new int[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dates[i] = Convert.ToDateTime(dt.Rows[i]["Date"]).ToString("dd-MMM");
                marks[i] = Convert.ToInt32(dt.Rows[i]["ObtainedMarks"]);
            }

            ChartStudent.Series["Marks"].Points.DataBindXY(dates, marks);
            ChartStudent.Series["Marks"].ChartType = SeriesChartType.Column;
            ChartStudent.ChartAreas[0].AxisX.Interval = 1;
            ChartStudent.ChartAreas[0].AxisX.Title = "Date";
            ChartStudent.ChartAreas[0].AxisY.Title = "Obtained Marks";
        }

        protected void BtnDownload_Click(object sender, EventArgs e)
        {
            // Future: Generate and download PDF analysis report
            // Currently placeholder for extension
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('PDF download functionality will be implemented here.');", true);
        }
    }
}
