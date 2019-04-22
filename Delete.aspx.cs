using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        int Contributor_id;
        Contributor_id = Convert.ToInt32(Session["ID"]);   

        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        string queryString = "SELECT Content.link ,Content.ID from Original_Content inner join Content on Content.ID = Original_Content.ID where Content.contributer_id = @Contributor_id";    // I want to get the contributor_id variable up (done)
        SqlDataAdapter da = new SqlDataAdapter(queryString, cnn);
        da.SelectCommand.Parameters.Add("@contributor_id", SqlDbType.Int).Value = Contributor_id;
        DataTable dtb = new DataTable();
        da.Fill(dtb);                                  
        gvcontent.DataSource = dtb;
        gvcontent.DataBind();

        cnn.Close();

    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        LinkButton lb = (LinkButton)sender;
        GridViewRow row = (GridViewRow)lb.NamingContainer;
        

        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Delete_Content", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@content_id", row.Cells[0].Text));             
        cmd.ExecuteReader();

        cnn.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }
}
