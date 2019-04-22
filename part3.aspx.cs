using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class part3 : System.Web.UI.Page
{
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;


        string type_name = TextBox1.Text;
        if (type_name.Length == 0)
            return;
        cnn = new SqlConnection(connectionString);
        
        cnn.Open();
        SqlCommand cmd = new SqlCommand("Staff_Create_Type", cnn); 
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@type_name", type_name));
        SqlDataReader rdr = cmd.ExecuteReader();
        cnn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.aspx");
    }
}
