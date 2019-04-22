using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_publicity_ad : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    int viewerID;
    //int viewerID = 1;
   


    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        if(Location.Text!="" && Description.Text != "")
        {
            SqlCommand cmd = new SqlCommand("Create_Ads", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
            cmd.Parameters.Add(new SqlParameter("@location", Location.Text));
            cmd.Parameters.Add(new SqlParameter("@description", Description.Text));
            cmd.ExecuteNonQuery(); ;
            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd2.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('Done :)');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                cmd2.Dispose();
                rdr2.Close();
            }
            cnn.Dispose();
            cnn.Close();
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd2.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('insert all the info please :(');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                cmd2.Dispose();
                rdr2.Close();
            }
        }
        

    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
