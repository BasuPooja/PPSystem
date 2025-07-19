using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class ViewJobdetail : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDesignations();
                FillData();
            }
        }

        private void LoadDesignations()
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT DISTINCT Designation FROM JD", con);
                SqlDataReader dr = cmd.ExecuteReader();
                DDLDesignation.Items.Clear();
                DDLDesignation.Items.Add(new ListItem("--Select--", ""));
                while (dr.Read())
                {
                    DDLDesignation.Items.Add(new ListItem(dr["Designation"].ToString(), dr["Designation"].ToString()));
                }
                dr.Close();
            }
            finally
            {
                con.Close();
            }
        }

        protected void FillData(string designationFilter = "", string searchKeyword = "")
        {
            try
            {
                con.Open();
                string query = @"SELECT j.Job_ID, j.Designation, j.Salary, j.Location, r.Experience, r.Qualification, r.Key_Skill 
                                 FROM JD j 
                                 INNER JOIN Requirement r ON j.Job_ID = r.Job_ID 
                                 WHERE (j.Designation LIKE @Designation OR @Designation = '') 
                                 AND ((j.Location LIKE @Search) OR (r.Key_Skill LIKE @Search) OR @Search = '')";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Designation", "%" + designationFilter + "%");
                cmd.Parameters.AddWithValue("@Search", "%" + searchKeyword + "%");

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            finally
            {
                con.Close();
            }
        }

        protected void DDLDesignation_SelectedIndexChanged(object sender, EventArgs e)
        {
            string designation = DDLDesignation.SelectedValue;
            string search = TxtSearch.Text.Trim();
            FillData(designation, search);
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            string designation = DDLDesignation.SelectedValue;
            string search = TxtSearch.Text.Trim();
            FillData(designation, search);
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            DDLDesignation.SelectedIndex = 0;
            TxtSearch.Text = "";
            FillData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            string designation = DDLDesignation.SelectedValue;
            string search = TxtSearch.Text.Trim();
            FillData(designation, search);
        }

    }
}
