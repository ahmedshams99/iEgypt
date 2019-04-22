using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        SqlDataReader dataReader;
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        dataReader=new SqlCommand("Update [User] set deactivation_date=null where ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader() ;
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] where ID="+Session["ID"].ToString()+";", cnn).ExecuteReader();
        dataReader.Read();
        Label1.Text = dataReader.GetValue(2) + " " + dataReader.GetValue(3) + " " + dataReader.GetValue(4);
        Label2.Text = dataReader.GetValue(1) + "";
        Label3.Text = dataReader.GetValue(5) + "";
        Label4.Text = dataReader.GetValue(5) + "";
        cnn.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        SqlCommand cmd;
        cmd = new SqlCommand("Deactivate_Profile", cnn);

        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@user_id", Session["ID"]));
        cmd.ExecuteReader();

        Session["ID"] = null;
        cnn.Close();
        Response.Redirect("Default.aspx");
    }
}
