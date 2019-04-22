using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        SqlDataReader dataReader = new SqlCommand("Select * from [User] where email='" + TextBox2.Text + "';", cnn).ExecuteReader();
        Boolean InvalidMail = dataReader.HasRows;
        dataReader.Close();
        Boolean CorrectBirthDate = false;
        Boolean CorrectHireDate = false;
        try
        {
            Convert.ToDateTime(TextBox6.Text);
            CorrectBirthDate = true;
        }
        catch (Exception){}
        try
        {
            Convert.ToDateTime(TextBox15.Text);
            CorrectHireDate = true;
        }
        catch (Exception) { }
        if (TextBox2.Text == "")
        {
            Label10.Text = "Invalid Email";
            Label10.Visible = true;
        }
        else if(TextBox8.Text == "")
        {
            Label10.Text = "Invalid Pass";
            Label10.Visible = true;
        }
        else if (InvalidMail)
        {
            Label10.Text = "Mail Already in use";
            Label10.Visible = true;
        }
        else if(!CorrectBirthDate)
        {
            Label10.Text = "Invalid Birthdate";
            Label10.Visible = true;
        }
        else if((Staff.Checked || Staff0.Checked) && !CorrectHireDate)
        {
            Label10.Text = "Invalid Hire Date";
            Label10.Visible = true;
        }
        else
        {
            SqlCommand cmd;
            cmd = new SqlCommand("Register_User", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            String type="";
            if (Viewer.Checked)
                type = "Viewer";
            else if (Contributor.Checked)
                type = "Contributor";
            else if (Staff.Checked)
                type = "Authorized Reviewer";
            else if (Staff0.Checked)
                type = "Content Manager";
            int yearsofExperience = TextBox12.Text.Length>0? Convert.ToInt32(TextBox12.Text):0;
            int workinghrs = TextBox16.Text.Length > 0 ? Convert.ToInt32(TextBox16.Text) : 0;
            int paymentrate = TextBox17.Text.Length > 0 ? Convert.ToInt32(TextBox17.Text) : 0;
            String hireDate = (Staff.Checked || Staff0.Checked)? TextBox15.Text: "1/1/1990";

            cmd.Parameters.Add(new SqlParameter("@usertype", type));
            cmd.Parameters.Add(new SqlParameter("@email", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@password", TextBox8.Text));
            cmd.Parameters.Add(new SqlParameter("@firstname", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("@middlename", TextBox4.Text));
            cmd.Parameters.Add(new SqlParameter("@lastname", TextBox5.Text));
            cmd.Parameters.Add(new SqlParameter("@birth_date", Convert.ToDateTime(TextBox6.Text)));
            cmd.Parameters.Add(new SqlParameter("@working_place_name", TextBox9.Text));
            cmd.Parameters.Add(new SqlParameter("@working_place_type", TextBox10.Text));
            cmd.Parameters.Add(new SqlParameter("@wokring_place_description", TextBox11.Text));
            cmd.Parameters.Add(new SqlParameter("@specilization", TextBox14.Text));
            cmd.Parameters.Add(new SqlParameter("@portofolio_link", TextBox13.Text));
            cmd.Parameters.Add(new SqlParameter("@years_experience", yearsofExperience));
            cmd.Parameters.Add(new SqlParameter("@hire_date", Convert.ToDateTime(hireDate)));
            cmd.Parameters.Add(new SqlParameter("@working_hours", workinghrs));
            cmd.Parameters.Add(new SqlParameter("@payment_rate", paymentrate));
            cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int id = 0;

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
            }
            Session["ID"] = id;
            cnn.Close();
            if (Viewer.Checked)
                Response.Redirect("ViewerProfile.aspx");
            else if (Contributor.Checked)
                Response.Redirect("ContributorProfile.aspx");
            else
                Response.Redirect("StaffProfile.aspx");
        }
    }

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        if(Viewer.Checked)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            TextBox9.Visible = true;
            TextBox10.Visible = true;
            TextBox11.Visible = true;

            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            TextBox12.Visible = false;
            TextBox13.Visible = false;
            TextBox14.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            TextBox15.Visible = false;
            TextBox16.Visible = false;
            TextBox17.Visible = false;
        }
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        if (Contributor.Checked)
        {
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            TextBox12.Visible = true;
            TextBox13.Visible = true;
            TextBox14.Visible = true;

            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            TextBox9.Visible = false;
            TextBox10.Visible = false;
            TextBox11.Visible = false;
            Label7.Visible = false;
            Label8.Visible = false;
            Label9.Visible = false;
            TextBox15.Visible = false;
            TextBox16.Visible = false;
            TextBox17.Visible = false;
        }
    }



    protected void Staff_CheckedChanged(object sender, EventArgs e)
    {
        if (Staff.Checked || Staff0.Checked)
        {
            Label7.Visible = true;
            Label8.Visible = true;
            Label9.Visible = true;
            TextBox15.Visible = true;
            TextBox16.Visible = true;
            TextBox17.Visible = true;

            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            TextBox9.Visible = false;
            TextBox10.Visible = false;
            TextBox11.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Label6.Visible = false;
            TextBox12.Visible = false;
            TextBox13.Visible = false;
            TextBox14.Visible = false;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
