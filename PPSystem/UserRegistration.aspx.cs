using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls; // ✅ REQUIRED for ListItem, DropDownList, etc.

namespace PPSystem
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string gender, t3;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=E:\.Net\Web\PPSystem\PPSystem\App_Data\PPS.mdf;Integrated Security=True");

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        //    if (RangeValidator1 != null)
        //    {
        //        RangeValidator1.MinimumValue = DateTime.Now.AddYears(-50).ToString("MM/dd/yyyy");
        //        RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToString("MM/dd/yyyy");
        //    }

        //    if (!IsPostBack)
        //    {
        //        BindDropDown();
        //        UserID();
        //    }
        //    else
        //    {
        //        // Repopulate password fields after postback
        //        TBPass.Attributes["value"] = TBPass.Text;
        //        TBCPass.Attributes["value"] = TBCPass.Text;
        //    }
        //}

        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

        //    if (!IsPostBack)
        //    {
        //        RangeValidator1.MinimumValue = DateTime.Now.AddYears(-50).ToString("MM/dd/yyyy");
        //        RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToString("MM/dd/yyyy");
        //        BindDropDown();
        //        UserID();
        //        TBImage.ImageUrl = "~/Image/Profile-icon.jpg"; // default on first load
        //    }
        //    else
        //    {
        //        // Rebind uploaded photo on postback
        //        if (Session["PhotoName"] != null)
        //        {
        //            TBImage.ImageUrl = "~/Picture/" + Session["PhotoName"].ToString();
        //        }

        //        // Retain password fields
        //        TBPass.Attributes["value"] = TBPass.Text;
        //        TBCPass.Attributes["value"] = TBCPass.Text;
        //    }
        //}


        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                RangeValidator1.MinimumValue = DateTime.Now.AddYears(-50).ToString("MM/dd/yyyy");
                RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToString("MM/dd/yyyy");
                BindDropDown();
                UserID();
                TBImage.ImageUrl = "~/Image/Profile-icon.jpg";
            }
            else
            {
                if (Session["PhotoName"] != null)
                {
                    TBImage.ImageUrl = "~/Picture/" + Session["PhotoName"].ToString();
                }

                TBPass.Attributes["value"] = TBPass.Text;
                TBCPass.Attributes["value"] = TBCPass.Text;
            }
        }

        protected void Uplode_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".bmp")
                {
                    string imgName = Guid.NewGuid().ToString() + fileExtension; // use GUID to avoid caching
                    string folderPath = Server.MapPath("~/Picture/");
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    FileUpload1.SaveAs(folderPath + imgName);
                    Session["PhotoName"] = imgName;
                    TBImage.ImageUrl = "~/Picture/" + imgName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please upload a valid image file (.jpg, .jpeg, .png, .bmp).');", true);
                }
            }
        }


        //protected void Uplode_Click(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();
        //        if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".bmp")
        //        {
        //            string imgName = FileUpload1.FileName;
        //            string folderPath = Server.MapPath("~/Picture/");
        //            if (!Directory.Exists(folderPath))
        //            {
        //                Directory.CreateDirectory(folderPath);
        //            }

        //            FileUpload1.SaveAs(folderPath + imgName);
        //            TBImage.ImageUrl = "~/Picture/" + imgName;
        //            Session["PhotoName"] = imgName;
        //            Session["PhotoBinary"] = File.ReadAllBytes(folderPath + imgName);
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please upload a valid image file (.jpg, .jpeg, .png, .bmp).');", true);
        //        }
        //    }
        //}

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload2.HasFile)
            {
                string fileExtension = Path.GetExtension(FileUpload2.FileName).ToLower();
                if (!(fileExtension == ".doc" || fileExtension == ".docx" || fileExtension == ".pdf"))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Please upload a valid document file (.doc, .docx, .pdf).');", true);
                    return;
                }
            }

            using (SqlCommand cmd = new SqlCommand("INSERT INTO Applicant VALUES(@v1,@v2,@v3,@v4,@v5,@v6,@v7,@v8,@v9,@v10,@v11,@v12)", con))
            {
                cmd.Parameters.AddWithValue("@v1", TBUID.Text);
                cmd.Parameters.AddWithValue("@v2", TBApply.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@v3", TBName.Text);
                cmd.Parameters.AddWithValue("@v4", TBEmail.Text);
                cmd.Parameters.AddWithValue("@v5", TBContact.Text);
                cmd.Parameters.AddWithValue("@v6", TBDOB.Text);
                cmd.Parameters.AddWithValue("@v7", TBLocation.Text);
                gender = RBMale.Checked ? "Male" : "Female";
                cmd.Parameters.AddWithValue("@v8", gender);
                cmd.Parameters.AddWithValue("@v9", TBPass.Text);

                string imgName = FileUpload2.FileName;
                string folderPath = Server.MapPath("~/Picture/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }
                FileUpload2.SaveAs(folderPath + imgName);
                string cvPath = "~/Picture/" + imgName;

                cmd.Parameters.AddWithValue("@v10", cvPath);
                cmd.Parameters.AddWithValue("@v11", TBImage.ImageUrl);
                cmd.Parameters.AddWithValue("@v12", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Successfully Registered!');", true);
                    Clear();
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                        con.Close();
                }
            }
        }

        void Clear()
        {
            UserID();
            TBName.Text = "";
            TBContact.Text = "";
            TBCPass.Text = "";
            TBPass.Text = "";
            TBEmail.Text = "";
            TBDOB.Text = "";
            RBFemale.Checked = false;
            RBMale.Checked = false;
            TBLocation.Text = "";
            TBImage.ImageUrl = "~/Image/Profile-icon.jpg";
        }

        void BindDropDown()
        {
            SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM JD", con);
            DataTable data = new DataTable();
            adapter.Fill(data);
            TBApply.DataSource = data;
            TBApply.DataTextField = "Designation";
            TBApply.DataBind();

            ListItem defaultItem = new ListItem("--Select--", "-1");
            defaultItem.Selected = true;
            TBApply.Items.Insert(0, defaultItem);
        }

        void UserID()
        {
            int v;
            using (SqlCommand cmd = new SqlCommand("SELECT MAX(UserID) FROM Applicant", con))
            {
                con.Open();
                var t = cmd.ExecuteScalar() as string;
                if (string.IsNullOrEmpty(t))
                {
                    TBUID.Text = "PPS01";
                }
                else
                {
                    int l = t.Length;
                    v = Convert.ToInt32(t.Substring(3, l - 3));
                    v++;
                    t3 = "PPS" + v;
                    TBUID.Text = t3;
                }
                con.Close();
            }
        }
    }
}
