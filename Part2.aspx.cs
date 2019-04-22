using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;


public partial class Part2 : System.Web.UI.Page
{
    


    

    

    protected void Button1_Click1(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string cat = TextBox1.Text;
        string sub = TextBox2.Text;
        if (cat.Length == 0)
            return;
        
        cnn = new SqlConnection(connectionString);
        
        cnn.Open();
        SqlCommand cmd1 = new SqlCommand("Staff_Create_Category", cnn);
        cmd1.CommandType = System.Data.CommandType.StoredProcedure;
        
        cmd1.Parameters.Add(new SqlParameter("@category_name", cat));
       
       cmd1.ExecuteReader();
        cnn.Close();
        cnn.Open();
        SqlCommand cmd2 = new SqlCommand("Staff_Create_Subcategory", cnn);
        cmd2.CommandType = System.Data.CommandType.StoredProcedure;

        cmd2.Parameters.Add(new SqlParameter("@category_name", cat));
        cmd2.Parameters.Add(new SqlParameter("@subcategory_name", sub));
        if(sub.Length>0)
            cmd2.ExecuteReader();
        cnn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.aspx");
    }
}
