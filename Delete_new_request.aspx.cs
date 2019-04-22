using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Delete_new_request : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    int viewerID;
    //int viewerID = 1;
    int contrID;


    protected void Page_Load(object sender, EventArgs e)
    {
       
            cnn.Open();
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
            string sqlQ = "SELECT * FROM New_Request left join [User] on New_Request.contributer_id = [User].ID where accept_status = 0 and viewer_id =" + viewerID;
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
            cnn.Close();
    }

    protected void lnkSelect_Click(object sender, EventArgs e)
    { 
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        int reqID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        Label1.Text = "Request is sent";
        SqlCommand cmd = new SqlCommand("Delete_New_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@request_id", reqID));
        cmd.ExecuteNonQuery(); ;
        cnn.Dispose();
        cnn.Close();
        Response.Redirect("Delete_new_request.aspx");
    }


    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
