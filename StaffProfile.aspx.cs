using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_StaffProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        SqlDataReader dataReader = new SqlCommand("Select * from [Viewer] where ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ViewerProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [Contributor] where ID=" + Session["ID"], cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ContributorProfile.aspx");
        dataReader.Close();

        dataReader = new SqlCommand("Update [User] set deactivation_date=null where ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader();
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] INNER JOIN Staff on [User].ID=Staff.ID where [User].ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader();
        dataReader.Read();
        Label1.Text = dataReader.GetValue(2) + " " + dataReader.GetValue(3) + " " + dataReader.GetValue(4);
        Label2.Text = dataReader.GetValue(1).ToString();
        Label3.Text = dataReader.GetValue(5).ToString();
        Label9.Text = dataReader.GetValue(6).ToString();
        Label4.Text = dataReader.GetValue(7).ToString();
        Label5.Text = dataReader.GetValue(10).ToString();
        Label6.Text = dataReader.GetValue(11).ToString();
        Label7.Text = dataReader.GetValue(12).ToString();
        Label8.Text = dataReader.GetValue(13).ToString();
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditStaff.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Session["ID"] = null;
        Response.Redirect("Default.aspx");
    }
}
