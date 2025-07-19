using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Web.UI.WebControls;
using System.Timers;
using System.Web.Services.Description;

namespace PPSystem
{
    public partial class Requirement : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDown();
            }
        }
        protected void clear()
        {
            BindDropDown();
            TBDesignation.Text = "";
            TBSalary.Text = "";
            TBLocation.Text = "";
            TBExperience.Text = "";
            TBQualification.Text = "";
            TBKeyskill.Text = "";
        }
        void BindDropDown()
        {
            SqlDataAdapter cmd1 = new SqlDataAdapter("Select * from JD", con);
            DataTable data=new DataTable();
            cmd1.Fill(data);
            TBJID.DataSource = data;
            TBJID.DataTextField = "Job_ID";
           // TBJID.DataValueField = "id";
            TBJID.DataBind();

            ListItem item1 = new ListItem("--Select--", "-1");
            item1.Selected = true;
            TBJID.Items.Insert(0, item1);
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("Insert into Requirement values(@v1,@v2,@v3,@v4)", con);
            if (TBJID.SelectedValue == "-1")
            {
                Response.Write("Please Select Job ID");
            }
            else 
            {
                cmd.Parameters.AddWithValue("v1", TBJID.Text);
                cmd.Parameters.AddWithValue("v2", TBExperience.Text);
                cmd.Parameters.AddWithValue("v3", TBQualification.Text);
                cmd.Parameters.AddWithValue("v4", TBKeyskill.Text);
            }            
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            string message = "Sucessfully Registered!!";
            MessageBox.Show(message);
            clear();
        }

        void filldataValue()
        {
            SqlCommand cmd2 = new SqlCommand("Select * from JD where Job_ID=@id", con);
            cmd2.Parameters.AddWithValue("id", TBJID.Text);
            SqlDataAdapter sda=new SqlDataAdapter(cmd2);
            DataSet data = new DataSet();
            sda.Fill(data);
            TBDesignation.Text = data.Tables[0].Rows[0]["Designation"].ToString();
            TBSalary.Text = data.Tables[0].Rows[0]["Salary"].ToString();
            TBLocation.Text = data.Tables[0].Rows[0]["Location"].ToString();
        }
        protected void TBJID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TBJID.SelectedValue == "-1")
            {
                MessageBox.Show("Please Select Job ID");
                clear();
            }
            else
            {
                filldataValue();
            }
            
        }
    }   
}