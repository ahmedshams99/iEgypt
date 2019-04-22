using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Part7 : System.Web.UI.Page
{

    protected void delete(object sender, EventArgs e)
    {
        string connectionString;
        SqlConnection cnn;
        
        connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        string[] args = new string[3];
        args = (sender as LinkButton).CommandArgument.ToString().Split(';');
        Console.WriteLine((sender as LinkButton).CommandArgument.ToString());
        string viewer_id = args[2];
        string original_content_id = args[1];
        
        DateTime date = Convert.ToDateTime(args[0]);
        cnn = new SqlConnection(connectionString);
        Session["ID"] = 10;
        cnn.Open();
        SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@viewer_id", viewer_id));
        cmd.Parameters.Add(new SqlParameter("@original_content_id", original_content_id)); 
        cmd.Parameters.Add(new SqlParameter("@written_time", date));
        SqlDataReader rdr = cmd.ExecuteReader();
        
        cnn.Close();
        Response.Redirect("Part7.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("StaffProfile.aspx");
    }
}
