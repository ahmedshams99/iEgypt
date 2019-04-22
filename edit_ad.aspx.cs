using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class edit_ad : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    int viewerID;
    //int viewerID = 1;
    int contrID;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
            cnn.Open();
            string sqlQ = "SELECT * FROM Advertisement where Viewer_id="+viewerID;
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void edit_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        int adID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        
        if (Description.Text != "" && Location.Text != "")
        {
            
            SqlCommand cmd = new SqlCommand("Edit_Ad", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ad_id", adID));
            cmd.Parameters.Add(new SqlParameter("@description", Description.Text));
            cmd.Parameters.Add(new SqlParameter("@location", Location.Text));
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
            Response.Redirect("edit_ad.aspx");

            
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd2.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('insert all the info please :(');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG",errorMSG, true);
                cmd2.Dispose();
                rdr2.Close();
            }
        }


    }

    protected void delete_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        
        int adID = Convert.ToInt32((sender as LinkButton).CommandArgument);

        
        SqlCommand cmd = new SqlCommand("Delete_Ads", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@ad_id", adID));
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
        Response.Redirect("edit_ad.aspx");
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
