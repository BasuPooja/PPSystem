using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class ViewContactForm : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
        }

        private void FillGrid(string filter = "")
        {
            try
            {
                con.Open();
                string query = "SELECT * FROM ContactUs";

                if (!string.IsNullOrEmpty(filter))
                {
                    query += " WHERE Name LIKE @filter OR Email LIKE @filter";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                if (!string.IsNullOrEmpty(filter))
                {
                    cmd.Parameters.AddWithValue("@filter", "%" + filter + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                // Handle or log error for debug
                Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
            }
            finally
            {
                con.Close();
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            FillGrid(TxtSearch.Text.Trim());
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TxtSearch.Text = "";
            FillGrid();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            FillGrid(TxtSearch.Text.Trim());
        }
    }
}
