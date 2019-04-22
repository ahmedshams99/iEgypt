using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Part_10 : System.Web.UI.Page
{

    protected void assign(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;

        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string contributor_id = (sender as LinkButton).CommandArgument;

        
        string request_id = TextBox1.Text;
        cnn = new SqlConnection(connectionString);
        cnn.Open();
        SqlCommand cmd = new SqlCommand("Assign_Contributor_Request", cnn); 
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@contributor_id", contributor_id));
        cmd.Parameters.Add(new SqlParameter("@new_request_id", request_id));
        SqlDataReader rdr = cmd.ExecuteReader();
        cnn.Close();
        Response.Redirect("Part10");
    }










    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.aspx");
    }
}
