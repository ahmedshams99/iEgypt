using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Part8 : System.Web.UI.Page
{

    
    protected void delete(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;


        string content_id = (sender as LinkButton).CommandArgument;

        cnn = new SqlConnection(connectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand("deleteboth", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@id", content_id));
        
        SqlDataReader rdr = cmd.ExecuteReader();
        cnn.Close();
        Response.Redirect("Part8");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.aspx");
    }
}
