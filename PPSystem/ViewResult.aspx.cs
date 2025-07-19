using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace PPSystem
{
    public partial class ViewResult : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
                BindChart();
            }
        }

        //private void BindGrid(string filter = "")
        //{
        //    DataTable dt = new DataTable();
        //    string query = "SELECT * FROM [Result]";
        //    if (!string.IsNullOrEmpty(filter))
        //    {
        //        query += " WHERE UserID LIKE @filter";
        //    }

        //    using (SqlCommand cmd = new SqlCommand(query, con))
        //    {
        //        if (!string.IsNullOrEmpty(filter))
        //        {
        //            cmd.Parameters.AddWithValue("@filter", "%" + filter + "%");
        //        }

        //        SqlDataAdapter da = new SqlDataAdapter(cmd);
        //        da.Fill(dt);
        //    }

        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}

        private void BindChart()
        {
            DataTable dt = new DataTable();
            using (SqlCommand cmd = new SqlCommand("SELECT UserID, SUM(ObtainedMarks) AS TotalMarks FROM Result GROUP BY UserID", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            string[] x = new string[dt.Rows.Count];
            int[] y = new int[dt.Rows.Count];

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                x[i] = dt.Rows[i]["UserID"].ToString();
                y[i] = Convert.ToInt32(dt.Rows[i]["TotalMarks"]);
            }

            Chart1.Series[0].Points.DataBindXY(x, y);
            Chart1.Series[0].ChartType = SeriesChartType.StackedColumn;
            Chart1.ChartAreas[0].AxisX.Title = "User ID";
            Chart1.ChartAreas[0].AxisY.Title = "Total Marks";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid(SearchBox.Text.Trim());
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string filter = SearchBox.Text.Trim();
            string fromDate = TxtFromDate.Text.Trim();
            string toDate = TxtToDate.Text.Trim();
            BindGrid(filter, fromDate, toDate);
        }


        private void BindGrid(string filter = "", string fromDate = "", string toDate = "")
        {
            DataTable dt = new DataTable();
            string query = "SELECT * FROM [Result] WHERE 1=1";

            if (!string.IsNullOrEmpty(filter))
            {
                query += " AND UserID LIKE @filter";
            }
            if (!string.IsNullOrEmpty(fromDate))
            {
                query += " AND CAST(Date AS DATE) >= @fromDate";
            }
            if (!string.IsNullOrEmpty(toDate))
            {
                query += " AND CAST(Date AS DATE) <= @toDate";
            }

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                if (!string.IsNullOrEmpty(filter))
                {
                    cmd.Parameters.AddWithValue("@filter", "%" + filter + "%");
                }
                if (!string.IsNullOrEmpty(fromDate))
                {
                    cmd.Parameters.AddWithValue("@fromDate", fromDate);
                }
                if (!string.IsNullOrEmpty(toDate))
                {
                    cmd.Parameters.AddWithValue("@toDate", toDate);
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void BtnViewAnalysis_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string userID = btn.CommandArgument;
            Response.Redirect($"StudentAnalysis.aspx?UserID={userID}");
        }
        protected void BtnReset_Click(object sender, EventArgs e)
        {
            SearchBox.Text = "";
            BindGrid();
        }



    }
}
