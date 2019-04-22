using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_contributor_profile : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    //  int viewerID = (int)Session[ID];
    int viewerID = 1;
    int contrID;


    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            cnn.Open();
            int id = Convert.ToInt32(Request.QueryString["ID"]);
            string sqlQ = "SELECT * FROM [User]  inner join Contributor on Contributor.ID = [User].ID where [User].ID =" + id;
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_new_content.aspx");
    }
}
