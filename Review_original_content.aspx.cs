using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Review_original_content : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    
    //int viewerID ;
    int viewerID=1;


    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
            
            string sqlQ = "SELECT * FROM ( (Original_Content Inner Join Content on Content.ID = Original_Content.ID ) inner join [User] on  [User].ID = Content.contributer_id)";
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void lnkSelect_Click(object sender, EventArgs e)
    {
        
        //viewerID = Convert.ToInt32(Session["ID"]);
        string r = Rating.Text;
        if (r != "")
        {
            int orgContID = Convert.ToInt32((sender as LinkButton).CommandArgument);

            try
            {
                SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                cnn.Open();
                int rate = Convert.ToInt32(Rating.Text);
                SqlCommand cmd = new SqlCommand("Rating_Original_Content", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@orignal_content_id", orgContID));
                cmd.Parameters.Add(new SqlParameter("@rating_value", rate));
                cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
                cmd.ExecuteNonQuery(); 
                cnn.Dispose();
                Response.Redirect("Review_original_content.aspx");
                
                
            }
            catch
            {
                SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                cnn.Open();
                SqlCommand cmd2 = new SqlCommand("getTime", cnn);
                cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
                using (SqlDataReader rdr2 = cmd2.ExecuteReader())
                {
                    
                    string errorMSG = "window.onload=function(){ alert('insert your rating as an integer please :(');}";
                    ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                    cmd2.Dispose();
                    rdr2.Close();
                }
            }
                
        }
        else
        {
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            cnn.Open();
            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd2.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('insert the your rating please :(');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                cmd2.Dispose();
                rdr2.Close();
            }
            cnn.Close();
        }
        
        
    }


    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
