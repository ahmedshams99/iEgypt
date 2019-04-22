using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
        {
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Label2.Visible = true;
            Label3.Visible = true;
            Label4.Visible = true;
            HyperLink2.Visible = true;
            Button1.Visible = true;
            Button2.Visible = false;
        }
        else
        {
            TextBox1.Visible = false;
            TextBox2.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            Label4.Visible = false;
            HyperLink2.Visible = false;
            Button1.Visible = false;
            Button2.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
        {
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cnn.Open();


            string email, pass;
            SqlCommand cmd;

            email = TextBox1.Text;
            pass = TextBox2.Text;
            cmd = new SqlCommand("User_login", cnn);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@email", email));
            cmd.Parameters.Add(new SqlParameter("@password", pass));

            cmd.Parameters.Add("@user_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

            int id = 0;

            using (SqlDataReader rdr = cmd.ExecuteReader())
            {
                id = Convert.ToInt32(cmd.Parameters["@user_id"].Value);
            }

            if (id == -1)
            {
                SqlDataReader dataReader = new SqlCommand("Select * from [User] where email='" + email + "';", cnn).ExecuteReader();
                Boolean correctMail = dataReader.HasRows;
                dataReader.Close();
                dataReader = new SqlCommand("Select * from [User] where email='" + email + "' and password='" + pass + "';", cnn).ExecuteReader();
                Boolean correctPass = dataReader.HasRows;
                if (!correctMail)
                    Label1.Text = "Incorrect Email";
                else if (!correctPass)
                    Label1.Text = "Incorrect Password";
                else
                    Label1.Text = "This account has been permenantly deactivated";
                Label1.Visible = true;
            }
            else
            {
                Session["ID"] = id;
                SqlDataReader dataReader = new SqlCommand("Select * from [Viewer] where ID=" + Session["ID"], cnn).ExecuteReader();
                dataReader.Read();
                if (dataReader.HasRows)
                    Response.Redirect("ViewerProfile.aspx");
                dataReader.Close();
                dataReader = new SqlCommand("Select * from [Contributor] where ID=" + Session["ID"], cnn).ExecuteReader();
                dataReader.Read();
                if (dataReader.HasRows)
                    Response.Redirect("ContributorProfile.aspx");
                Response.Redirect("StaffProfile.aspx");
                cnn.Close();
            }
        }
        else
        {

        }
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        SqlDataReader dataReader = new SqlCommand("Select * from [Viewer] where ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ViewerProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [Contributor] where ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ContributorProfile.aspx");
        Response.Redirect("StaffProfile.aspx");
        cnn.Close();
    }
}
