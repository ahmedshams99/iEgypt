using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Original_Content_Search", cnn);
        
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        if (Type.Checked)
            cmd.Parameters.Add(new SqlParameter("@typename", CategoryTypeSearch.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@typename", DBNull.Value));


        if (Category.Checked)
            cmd.Parameters.Add(new SqlParameter("@categoryname", CategoryTypeSearch.Text));
        else
            cmd.Parameters.Add(new SqlParameter("@categoryname", DBNull.Value));

        SqlDataReader dataReader = cmd.ExecuteReader();
        String Output = " ";

        while (dataReader.Read())
            Output = Output + "Link: " + dataReader.GetValue(7) + ", Uploaded At:"+ dataReader.GetValue(8)
                +", SubCategory Type:"+ dataReader.GetValue(10) + ", Rating: " + dataReader.GetValue(5) + "</br>";
        
        dataReader.Close();

        cnn.Close();

        L1.Text = Output;
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();


        string text;
        SqlCommand cmd;

        text = ContributorSearch.Text;
        cmd = new SqlCommand("Contributor_Search", cnn);

        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@fullname", text));
        
        SqlDataReader dataReader = cmd.ExecuteReader();
        String Output = " ";

        while (dataReader.Read())
            Output = Output + "Email: " + dataReader.GetValue(6) 
                + ", Age: " + dataReader.GetValue(11)
                + ", Years of Experience: " + dataReader.GetValue(1)
                + ", Portfolio Link: " + dataReader.GetValue(2) + ", Specialization: " + dataReader.GetValue(3) + "</br>";

        dataReader.Close();

        cnn.Close();

        L1.Text = Output;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {

        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Order_Contributor", cnn);

        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        SqlDataReader dataReader = cmd.ExecuteReader();
        String Output = " ";

        while (dataReader.Read())
            Output = Output + "Full Name: " + dataReader.GetValue(7) + " " +dataReader.GetValue(8) + " " 
                + dataReader.GetValue(9)+ "</br>";/* " "+ dataReader.GetValue(8)+" "
                + dataReader.GetValue(9) + ", Years of Experience: " + dataReader.GetValue(1) 
                + ", Portfolio Link: " + dataReader.GetValue(2) + ", Specialization: " 
                + dataReader.GetValue(3) + "</br>";*/

        dataReader.Close();

        cnn.Close();

        L1.Text = Output;
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();


        SqlCommand cmd1 = new SqlCommand("Contributor_Search", cnn);
        cmd1.CommandType = System.Data.CommandType.StoredProcedure;
        cmd1.Parameters.Add(new SqlParameter("@fullname", ApprovedOContent.Text));
        SqlDataReader dataReader = cmd1.ExecuteReader();
        dataReader.Read();
        if (CheckBox1.Checked && !dataReader.HasRows)
        {
            L1.Text = "Invalid Name";
        }
        else
        {
            SqlCommand cmd = new SqlCommand("Show_Original_Content", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            if (CheckBox1.Checked)
                cmd.Parameters.Add(new SqlParameter("@contributor_id", Convert.ToInt32(dataReader.GetValue(0))));
            else
                cmd.Parameters.Add(new SqlParameter("@contributor_id", DBNull.Value));
            dataReader.Close();
        
            dataReader = cmd.ExecuteReader();
            String Output = " ";

            while (dataReader.Read())
                Output = Output + "Content Link: " + dataReader.GetValue(1)
                    + ", Category type: " + dataReader.GetValue(4)
                    + ", Subcategory Name: " + dataReader.GetValue(5)
                    + ", type: " + dataReader.GetValue(6)
                    + ", Full Name: " + dataReader.GetValue(14) +" "+ dataReader.GetValue(15) +" "+ dataReader.GetValue(16)
                    + ", Email: " + dataReader.GetValue(13)
                    + ", Years of Experience: " + dataReader.GetValue(8) 
                    + ", Portfolio Link: " + dataReader.GetValue(9) 
                    + ", Specialization: " + dataReader.GetValue(10) + "</br>";

            dataReader.Close();

            cnn.Close();

            L1.Text = Output;
        }
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
