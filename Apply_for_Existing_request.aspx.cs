using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Apply_for_Existing_request : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    int viewerID;
    //int viewerID =1;
    int OrgContID;

    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if(Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
            cnn.Open();
            string sqlQ = "SELECT * FROM ( (Original_Content Inner Join Content on Content.ID = Original_Content.ID ) inner join [User] on  [User].ID = Content.contributer_id) where Original_Content.rating >3"; 
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void lnkSelect_Click(object sender,EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        OrgContID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        
        SqlCommand cmd = new SqlCommand("Apply_Existing_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@original_content_id", OrgContID));
        cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
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



    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
