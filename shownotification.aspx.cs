using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shownotification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        int user_id = Convert.ToInt32(Session["ID"]);                                     
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Show_Notiﬁcation", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@user_id", user_id));
        SqlDataAdapter da = new SqlDataAdapter(cmd );
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        gvshownotif.DataSource = dtb;
        gvshownotif.DataBind();

        cnn.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }
}
