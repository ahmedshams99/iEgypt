using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class part1 : System.Web.UI.Page
{


   

    
    protected void accept(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;


        string content_id = (sender as LinkButton).CommandArgument;
       
        cnn = new SqlConnection(connectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand("filterboth", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", Session["ID"]));
        cmd.Parameters.Add(new SqlParameter("@original_content", content_id));
        cmd.Parameters.Add(new SqlParameter("@status", 1));
        SqlDataReader rdr = cmd.ExecuteReader();
        cnn.Close();
        Response.Redirect("part1.aspx");

    }
    protected void reject(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;


        string content_id = (sender as LinkButton).CommandArgument;

        cnn = new SqlConnection(connectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand("filterboth", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", Session["ID"]));
        cmd.Parameters.Add(new SqlParameter("@original_content", content_id));
        cmd.Parameters.Add(new SqlParameter("@status","0"));
        SqlDataReader rdr = cmd.ExecuteReader();
        cnn.Close();
        Response.Redirect("part1.aspx");
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.Aspx");
    }

    
}
