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
        int contributorid = Convert.ToInt32(Session["ID"]);
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        string queryString = "Select Message.[text] , [User].first_name , [User].middle_name , [User].last_name , Message.sent_at from Message inner join[User] on Message.viewer_id = [User].ID  where Message.sender_type = 1 and Message.contributer_id = @contributorid";
        SqlDataAdapter da = new SqlDataAdapter(queryString, cnn);
        da.SelectCommand.Parameters.Add("@contributorid", SqlDbType.Int).Value = contributorid;
        DataTable dtb = new DataTable();
        da.Fill(dtb);
        gvrecievemessage.DataSource = dtb;
        gvrecievemessage.DataBind();

        cnn.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }
}
