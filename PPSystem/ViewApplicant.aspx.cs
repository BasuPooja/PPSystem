using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class ViewApplicant : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData(string searchQuery = "")
        {
            con.Open();
            string query = "SELECT [UserID], [Applying_for], [AName], [AEmail], [AContact], [DOB], [Address], [AGender], [CV], [Image], [Date_Time] FROM [Applicant]";
            if (!string.IsNullOrEmpty(searchQuery))
            {
                query += " WHERE [AName] LIKE @search OR [AEmail] LIKE @search OR [Applying_for] LIKE @search";
            }

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            if (!string.IsNullOrEmpty(searchQuery))
            {
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
            }

            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }

        protected void BtnFilter_Click(object sender, EventArgs e)
        {
            LoadData(TxtSearch.Text.Trim());
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TxtSearch.Text = "";
            LoadData();
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadData(TxtSearch.Text.Trim());
        }
    }
}
