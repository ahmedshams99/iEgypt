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
    int viewerID ;
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
            string sqlQ = "SELECT * FROM ( (New_Request left join [User] on New_Request.contributer_id = [User].ID) inner join Contributor on Contributor.ID = [User].ID) where viewer_id =" + viewerID;
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void lnkSelect_Click(object sender, EventArgs e)
    { 
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        int contrID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        
        Response.Redirect("view_contributor_profile.aspx?ID="+contrID);
    }


    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
