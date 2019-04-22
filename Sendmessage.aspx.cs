using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlDataAdapter da = new SqlDataAdapter("SELECT [User].ID ,first_name , middle_name , last_name FROM [User] inner join Viewer on Viewer.ID = [User].ID ", cnn);
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        gvViewer.DataSource = dtb;
        gvViewer.DataBind();

        cnn.Close();


    }

    protected void select_Click(object sender, EventArgs e)   // still not complete
    {
        int Contributor_id = Convert.ToInt32(Session["ID"]); ;
        String msg;
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        msg = TextBox1.Text;

        LinkButton lb = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lb.NamingContainer;
        

        SqlCommand cmd = new SqlCommand("Send_Message", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@msg_text", msg));
        cmd.Parameters.Add(new SqlParameter("@viewer_id", row.Cells[0].Text));
        cmd.Parameters.Add(new SqlParameter("@contributor_id", Contributor_id));
        cmd.Parameters.Add(new SqlParameter("@sender_type", 1));
        cmd.Parameters.Add(new SqlParameter("@sent_at", DateTime.Now));
        cmd.ExecuteReader();

        cnn.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }
}
