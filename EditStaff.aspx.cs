using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_EditStaff : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        SqlDataReader dataReader = new SqlCommand("Select * from [User] INNER JOIN Viewer on [User].ID=Viewer.ID where [User].ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ViewerProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] INNER JOIN Contributor on [User].ID=Contributor.ID where [User].ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ContributorProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] INNER JOIN Staff on [User].ID=Staff.ID where [User].ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (Session["IN"] == null)
        {
            Session["IN"] = true;
            TextBox1.Text = dataReader.GetValue(1).ToString();
            TextBox2.Text = dataReader.GetValue(7).ToString();
            TextBox3.Text = dataReader.GetValue(2).ToString();
            TextBox4.Text = dataReader.GetValue(3).ToString();
            TextBox5.Text = dataReader.GetValue(4).ToString();
            TextBox6.Text = dataReader.GetValue(5).ToString();
            TextBox7.Text = dataReader.GetValue(10).ToString();
            TextBox8.Text = dataReader.GetValue(11).ToString();
            TextBox9.Text = dataReader.GetValue(12).ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        SqlCommand cmd;
        cmd = new SqlCommand("Edit_Profile", cnn);
        SqlDataReader dataReader = new SqlCommand("Select * from [User] where email='" + TextBox1.Text + "' and ID !=" + Session["ID"] + ";", cnn).ExecuteReader();
        Boolean InvalidMail = dataReader.HasRows;
        dataReader.Close();
        Boolean CorrectHours = false;
        Boolean CorrectRate = false;
        Boolean CorrectDate = false;
        try
        {
            Convert.ToInt32(TextBox8.Text);
            CorrectHours = true;
        }
        catch (Exception) { }
        try
        {
            Convert.ToDecimal(TextBox9.Text);
            CorrectRate = true;
        }
        catch (Exception) { }
        try
        {
            Convert.ToDateTime(TextBox6.Text);
            CorrectDate = true;
        }
        catch (Exception) { }
        if (TextBox1.Text == "" || TextBox1.Text.Length == 0)
        {
            Label1.Text = "Invalid Email";
            Label1.Visible = true;
        }
        else if (TextBox2.Text == "")
        {
            Label1.Text = "Invalid Pass";
            Label1.Visible = true;
        }
        else if (InvalidMail)
        {
            Label1.Text = "Mail Already in use";
            Label1.Visible = true;
        }
        else if(!CorrectDate)
        {
            Label1.Text = "Invalid Date Of Birth";
            Label1.Visible = true;
        }
        else if (!CorrectHours)
        {
            Label1.Text = "Invalid Working Hours";
            Label1.Visible = true;
        }
        else if(!CorrectRate)
        {
            Label1.Text = "Invalid Payment Rate";
            Label1.Visible = true;
        }
        else
        {
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_id", Session["ID"]));
            cmd.Parameters.Add(new SqlParameter("@email", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@password", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@firstname", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("@middlename", TextBox4.Text));
            cmd.Parameters.Add(new SqlParameter("@lastname", TextBox5.Text));
            cmd.Parameters.Add(new SqlParameter("@birth_date", TextBox6.Text));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", ""));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", ""));
            cmd.Parameters.Add(new SqlParameter("@wokring_place_description", ""));
            cmd.Parameters.Add(new SqlParameter("@specilization", ""));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", ""));
            cmd.Parameters.Add(new SqlParameter("@years_experience", Convert.ToInt32(0)));
            cmd.Parameters.Add(new SqlParameter("@hire_date", Convert.ToDateTime(TextBox7.Text)));
            cmd.Parameters.Add(new SqlParameter("@working_hours", Convert.ToInt32(TextBox8.Text)));
            cmd.Parameters.Add(new SqlParameter("@payment_rate", Convert.ToDecimal(TextBox9.Text)));
            cmd.ExecuteReader();
            Session["IN"] = null;
            Response.Redirect("StaffProfile.aspx");
        }
    }
}
