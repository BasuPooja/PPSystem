using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PPSystem
{
    public partial class ViewApptitudeQstn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillData();
            }
        }

        protected void FillData()
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = con;

                string query = "SELECT * FROM AptitudeQuestion WHERE 1=1";

                if (TBQType.SelectedItem.Text != "--Select--")
                {
                    query += " AND Q_Type = @qtype";
                    cmd.Parameters.AddWithValue("@qtype", TBQType.SelectedItem.Text);
                }

                if (!string.IsNullOrEmpty(TxtSearch.Text))
                {
                    query += " AND Question LIKE @search";
                    cmd.Parameters.AddWithValue("@search", "%" + TxtSearch.Text + "%");
                }

                cmd.CommandText = query;

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }

        protected void TBQType_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillData();
        }

        protected void BtnFilter_Click(object sender, EventArgs e)
        {
            FillData();
        }

        protected void BtnReset_Click(object sender, EventArgs e)
        {
            TBQType.SelectedIndex = 0;
            TxtSearch.Text = "";
            FillData();
        }
        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            FillData(); 
        }
    }
}
