using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Net.Http.Headers;
using Newtonsoft.Json;
using System.IO;
using System.Threading.Tasks;

namespace PPSystem
{
    public partial class PreferedCV : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=E:\\.Net\\Web\\PPSystem\\PPSystem\\App_Data\\PPS.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDown();
                PanelSkillsOutput.Visible = false;
            }
        }

        protected void clear()
        {
            TBJID.Text = "";
            TBDesignation.Text = "";
            TBSalary.Text = "";
            TBLocation.Text = "";
        }

        void BindDropDown()
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM JD", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            TBJID.DataSource = dt;
            TBJID.DataTextField = "Job_ID";
            TBJID.DataBind();
            TBJID.Items.Insert(0, new ListItem("--Select--", "-1"));
        }

        void filldataValue()
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM JD WHERE Job_ID=@id", con);
            cmd.Parameters.AddWithValue("@id", TBJID.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                TBDesignation.Text = ds.Tables[0].Rows[0]["Designation"].ToString();
                TBSalary.Text = ds.Tables[0].Rows[0]["Salary"].ToString();
                TBLocation.Text = ds.Tables[0].Rows[0]["Location"].ToString();
            }
        }

        protected void TBJID_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (TBJID.SelectedIndex == 0)
            {
                clear();
                PanelApplicantList.Visible = false;
                return;
            }

            filldataValue();

            string designation = TBDesignation.Text;

            SqlCommand cmd = new SqlCommand("SELECT UserID, AName FROM Applicant WHERE Applying_for = @designation", con);
            cmd.Parameters.AddWithValue("@designation", designation);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            GridApplicantList.DataSource = dt;
            GridApplicantList.DataBind();
            PanelApplicantList.Visible = dt.Rows.Count > 0;
        }

        // protected async void Button1_Click(object sender, EventArgs e)
        // {
        //     PanelSkillsOutput.Visible = true;
        //     LabelSkills.Visible = true;

        //     // Get required skills and experience
        //     string requiredSkillsCsv = "";
        //     string requiredExperience = "";
        //     using (SqlCommand cmd = new SqlCommand("SELECT Key_Skill, Experience FROM Requirement WHERE Job_ID = @jobId", con))
        //     {
        //         cmd.Parameters.AddWithValue("@jobId", TBJID.SelectedValue);
        //         con.Open();
        //         SqlDataReader reader = cmd.ExecuteReader();
        //         if (reader.Read())
        //         {
        //             requiredSkillsCsv = reader["Key_Skill"].ToString();
        //             requiredExperience = reader["Experience"].ToString();
        //         }
        //         con.Close();
        //     }

        //     if (string.IsNullOrWhiteSpace(requiredSkillsCsv))
        //     {
        //         LabelSkills.Visible = true;
        //         LabelSkills.Text = "No required skills found for this job.";
        //         return;
        //     }

        //     List<string> requiredSkills = requiredSkillsCsv.Split(',').Select(s => s.Trim().ToLower()).ToList();

        //     // Get applicants for the designation
        //     DataTable applicants = new DataTable();
        //     using (SqlCommand cmd = new SqlCommand("SELECT UserID, AName, CV FROM Applicant WHERE Applying_for = @designation", con))
        //     {
        //         cmd.Parameters.AddWithValue("@designation", TBDesignation.Text);
        //         SqlDataAdapter da = new SqlDataAdapter(cmd);
        //         da.Fill(applicants);
        //     }

        //     if (applicants.Rows.Count == 0)
        //     {
        //         LabelSkills.Visible = true;
        //         LabelSkills.Text = "No applicants found for this job.";
        //         return;
        //     }

        //     // Prepare result table
        //     DataTable resultTable = new DataTable();
        //     resultTable.Columns.Add("UserID");
        //     resultTable.Columns.Add("AName");
        //     resultTable.Columns.Add("CVName");
        //     resultTable.Columns.Add("PartExperience"); // Extracted from CV
        //     resultTable.Columns.Add("RequiredExperience");
        //     resultTable.Columns.Add("MatchedSkills");
        //     resultTable.Columns.Add("TotalMatchedSkills");
        //     resultTable.Columns.Add("ObtainedMarks");
        //     resultTable.Columns.Add("MatchPercent");
        //     resultTable.Columns.Add("FinalStatus");
        //     resultTable.Columns.Add("Action_Status");

        //     foreach (DataRow applicant in applicants.Rows)
        //     {
        //         string userId = applicant["UserID"].ToString();
        //         string name = applicant["AName"].ToString();
        //         string cvPathRelative = applicant["CV"].ToString();
        //         string cvPath = Server.MapPath(cvPathRelative);

        //         int obtainedMarks = 0;
        //         using (SqlCommand cmd = new SqlCommand("SELECT ObtainedMarks FROM Result WHERE UserID = @uid", con))
        //         {
        //             cmd.Parameters.AddWithValue("@uid", userId);
        //             con.Open();
        //             var marksResult = cmd.ExecuteScalar();
        //             con.Close();

        //             if (marksResult != null)
        //                 obtainedMarks = Convert.ToInt32(marksResult);
        //         }

        //         if (!File.Exists(cvPath))
        //         {
        //             resultTable.Rows.Add(userId, name, "File Not Found", requiredExperience, "-", "0", obtainedMarks, "0%", "Rejected");
        //             continue;
        //         }

        //         try
        //         {
        //             using (var httpClient = new HttpClient())
        //             using (var formData = new MultipartFormDataContent())
        //             using (var fileStream = File.OpenRead(cvPath))
        //             {
        //                 var fileContent = new StreamContent(fileStream);
        //                 fileContent.Headers.ContentType = new MediaTypeHeaderValue("application/pdf");
        //                 formData.Add(fileContent, "cv", Path.GetFileName(cvPath));

        //                 var response = await httpClient.PostAsync("http://127.0.0.1:5000/extract_skills", formData);
        //                 response.EnsureSuccessStatusCode();

        //                 var jsonString = await response.Content.ReadAsStringAsync();
        //                 //var json = JsonConvert.DeserializeObject<Dictionary<string, List<string>>>(jsonString);
        //                 var jsonObj = JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonString);
        //                 var skills = JsonConvert.DeserializeObject<List<string>>(jsonObj["skills"].ToString());
        //                 string extractedExperience = jsonObj.ContainsKey("experience") ? jsonObj["experience"].ToString() : "Not Mentioned";

        //                 List<string> extractedSkills = skills.Select(s => s.ToLower()).ToList();
        //                 List<string> matchedSkills = extractedSkills.Intersect(requiredSkills).ToList();

        //                 double matchPercent = requiredSkills.Count > 0 ? (matchedSkills.Count * 100.0) / requiredSkills.Count : 0;

        //                 string finalStatus = (matchPercent >= 60 && obtainedMarks >= 40) ? "Selected" : "Rejected";

        //                 resultTable.Rows.Add(
        //                     userId,
        //                     name,
        //                     Path.GetFileName(cvPath),
        //                     extractedExperience,              // from Applicant table
        //                     requiredExperience,
        //                     string.Join(", ", matchedSkills),
        //                     matchedSkills.Count.ToString(),
        //                     obtainedMarks.ToString(),
        //                     $"{matchPercent:F1}%",
        //                     finalStatus,
        //                     GetCurrentStatus(userId)
        //                 );
        //             }
        //         }
        //         catch (Exception ex)
        //         {
        //             resultTable.Rows.Add(userId, name, Path.GetFileName(cvPath), requiredExperience, "Error: " + ex.Message, "0", obtainedMarks.ToString(), "0%", "Rejected");
        //         }
        //     }

        //     CVMatchGrid.DataSource = resultTable;
        //     CVMatchGrid.DataBind();
        // }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            PanelSkillsOutput.Visible = true;
            LabelSkills.Visible = false;

            // Get required skills and experience
            string requiredSkillsCsv = "";
            string requiredExperience = "";
            using (SqlCommand cmd = new SqlCommand("SELECT Key_Skill, Experience FROM Requirement WHERE Job_ID = @jobId", con))
            {
                cmd.Parameters.AddWithValue("@jobId", TBJID.SelectedValue);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    requiredSkillsCsv = reader["Key_Skill"].ToString();
                    requiredExperience = reader["Experience"].ToString();
                }
                con.Close();
            }

            if (string.IsNullOrWhiteSpace(requiredSkillsCsv))
            {
                LabelSkills.Visible = true;
                LabelSkills.Text = "No required skills found for this job.";
                return;
            }

            List<string> requiredSkills = requiredSkillsCsv.Split(',').Select(s => s.Trim().ToLower()).ToList();

            // Get applicants for the designation
            DataTable applicants = new DataTable();
            using (SqlCommand cmd = new SqlCommand("SELECT UserID, AName, CV FROM Applicant WHERE Applying_for = @designation", con))
            {
                cmd.Parameters.AddWithValue("@designation", TBDesignation.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(applicants);
            }

            if (applicants.Rows.Count == 0)
            {
                LabelSkills.Visible = true;
                LabelSkills.Text = "No applicants found for this job.";
                return;
            }

            // Prepare result table
            DataTable resultTable = new DataTable();
            resultTable.Columns.Add("UserID");
            resultTable.Columns.Add("AName");
            resultTable.Columns.Add("CVName");
            resultTable.Columns.Add("PartExperience");           // from API
            resultTable.Columns.Add("RequiredExperience");
            resultTable.Columns.Add("MatchedSkills");
            resultTable.Columns.Add("TotalMatchedSkills");
            resultTable.Columns.Add("ObtainedMarks");
            resultTable.Columns.Add("MatchPercent");
            resultTable.Columns.Add("FinalStatus");
            resultTable.Columns.Add("Action_Status");            // from DB

            foreach (DataRow applicant in applicants.Rows)
            {
                string userId = applicant["UserID"].ToString();
                string name = applicant["AName"].ToString();
                string cvPathRelative = applicant["CV"].ToString();
                string cvPath = Server.MapPath(cvPathRelative);

                int obtainedMarks = 0;
                using (SqlCommand cmd = new SqlCommand("SELECT ObtainedMarks FROM Result WHERE UserID = @uid", con))
                {
                    cmd.Parameters.AddWithValue("@uid", userId);
                    con.Open();
                    var marksResult = cmd.ExecuteScalar();
                    con.Close();
                    if (marksResult != null)
                        obtainedMarks = Convert.ToInt32(marksResult);
                }

                if (!File.Exists(cvPath))
                {
                    resultTable.Rows.Add(userId, name, "File Not Found", "Not Mentioned", requiredExperience, "-", "0", obtainedMarks.ToString(), "0%", "Rejected", GetCurrentStatus(userId));
                    continue;
                }

                try
                {
                    using (var httpClient = new HttpClient())
                    using (var formData = new MultipartFormDataContent())
                    using (var fileStream = File.OpenRead(cvPath))
                    {
                        var fileContent = new StreamContent(fileStream);
                        fileContent.Headers.ContentType = new MediaTypeHeaderValue("application/pdf");
                        formData.Add(fileContent, "cv", Path.GetFileName(cvPath));

                        var response = await httpClient.PostAsync("http://127.0.0.1:5000/extract_skills", formData);
                        response.EnsureSuccessStatusCode();

                        var jsonString = await response.Content.ReadAsStringAsync();
                        var jsonObj = JsonConvert.DeserializeObject<Dictionary<string, object>>(jsonString);
                        var skills = JsonConvert.DeserializeObject<List<string>>(jsonObj["skills"].ToString());
                        string extractedExperience = jsonObj.ContainsKey("experience") ? jsonObj["experience"].ToString() : "Not Mentioned";

                        List<string> extractedSkills = skills.Select(s => s.ToLower()).ToList();
                        List<string> matchedSkills = extractedSkills.Intersect(requiredSkills).ToList();
                        double matchPercent = requiredSkills.Count > 0 ? (matchedSkills.Count * 100.0) / requiredSkills.Count : 0;
                        string finalStatus = (matchPercent >= 60 && obtainedMarks >= 40) ? "Selected" : "Rejected";

                        resultTable.Rows.Add(
                            userId,
                            name,
                            Path.GetFileName(cvPath),
                            extractedExperience,
                            requiredExperience,
                            string.Join(", ", matchedSkills),
                            matchedSkills.Count.ToString(),
                            obtainedMarks.ToString(),
                            $"{matchPercent:F1}%",
                            finalStatus,
                            GetCurrentStatus(userId)
                        );
                    }
                }
                catch (Exception ex)
                {
                    resultTable.Rows.Add(userId, name, Path.GetFileName(cvPath), "Error", requiredExperience, "Error: " + ex.Message, "0", obtainedMarks.ToString(), "0%", "Rejected", GetCurrentStatus(userId));
                }
            }

            CVMatchGrid.DataSource = resultTable;
            CVMatchGrid.DataBind();
        }

        // 🔍 Helper to fetch Action_Status
        private string GetCurrentStatus(string userId)
        {
            using (SqlCommand cmd = new SqlCommand("SELECT Action_Status FROM Applicant WHERE UserID = @uid", con))
            {
                cmd.Parameters.AddWithValue("@uid", userId);
                con.Open();
                var result = cmd.ExecuteScalar();
                con.Close();
                return result?.ToString() ?? "Pending";
            }
        }

        protected void CVMatchGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //System.Diagnostics.Debug.WriteLine("Command: " + e.CommandName);
            //Response.Write($"<script>alert('{e.CommandName} clicked');</script>");


            if (e.CommandName == "Approve" || e.CommandName == "Reject")
            {
                string userId = e.CommandArgument.ToString();
                string action = e.CommandName == "Approve" ? "Approved" : "Rejected";
                string actionDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

                using (SqlCommand cmd = new SqlCommand("UPDATE Applicant SET Action_Status = @status, Action_Date_Time = @date WHERE UserID = @uid", con))
                {
                    cmd.Parameters.AddWithValue("@status", action);
                    cmd.Parameters.AddWithValue("@date", actionDate);
                    cmd.Parameters.AddWithValue("@uid", userId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

                // Optional: Notify & Refresh
                LabelSkills.Visible = true;
                LabelSkills.Text = $"✅ Applicant {userId} has been {action}!";

                // Refresh grid
                Button1_Click(null, null);  // re-scan to update status/buttons
            }
        }


        // protected void CVMatchGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        // {
        //     if (e.CommandName == "Approve" || e.CommandName == "Reject")
        //     {
        //         string userId = e.CommandArgument.ToString();
        //         string action = e.CommandName == "Approve" ? "Approved" : "Rejected";
        //         string actionDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

        //         // Update status and timestamp in Applicant table
        //         using (SqlCommand cmd = new SqlCommand("UPDATE Applicant SET Action_Status = @status, Action_Date_Time = @date WHERE UserID = @uid", con))
        //         {
        //             cmd.Parameters.AddWithValue("@status", action);
        //             cmd.Parameters.AddWithValue("@date", actionDate);
        //             cmd.Parameters.AddWithValue("@uid", userId);

        //             con.Open();
        //             cmd.ExecuteNonQuery();
        //             con.Close();
        //         }

        //         // Show message
        //         LabelSkills.Visible = true;
        //         LabelSkills.Text = $"✅ Applicant {userId} has been {action}!";

        //         // ✅ Refresh CVMatchGrid with updated status
        //         Button1_Click(null, null);
        //     }
        // }

        public string GetStatusCss(string status)
        {
            switch (status.ToLower())
            {
                case "approved":
                    return "badge badge-success";
                case "rejected":
                    return "badge badge-danger";
                default:
                    return "badge badge-secondary";
            }
        }

    }
}
