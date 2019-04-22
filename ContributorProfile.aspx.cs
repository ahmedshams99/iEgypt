using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_ContributorProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
           Response.Redirect("Default.aspx");
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        SqlDataReader dataReader = new SqlCommand("Select * from [Viewer] where ID=" + Session["ID"],cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ViewerProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [Staff] where ID=" + Session["ID"],cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("StaffProfile.aspx");
        dataReader.Close();
       
        dataReader = new SqlCommand("Update [User] set deactivation_date=null where ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader();
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] INNER JOIN Contributor on [User].ID=Contributor.ID where [User].ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader();
        dataReader.Read();
        Label1.Text = dataReader.GetValue(2) + " " + dataReader.GetValue(3) + " " + dataReader.GetValue(4);
        Label2.Text = dataReader.GetValue(1) + "";
        Label3.Text = dataReader.GetValue(5) + "";
        Label8.Text = dataReader.GetValue(6) + "";
        Label4.Text = dataReader.GetValue(7) + "";
        Label5.Text = dataReader.GetValue(10) + "";
        Label6.Text = dataReader.GetValue(11) + "";
        Label7.Text = dataReader.GetValue(12) + "";
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
        Response.Redirect("EditContributor.aspx");
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

    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("Newrequest.aspx");
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Response.Redirect("uploadoriginalcontent.aspx");
    }

    protected void Button9_Click(object sender, EventArgs e)
    {
        Response.Redirect("Uploadnewcontent.aspx");
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("Sendmessage.aspx");
    }

    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("Recievemessage.aspx");
    }

    protected void Button10_Click(object sender, EventArgs e)
    {
        Response.Redirect("Delete.aspx");
    }

    protected void Button11_Click(object sender, EventArgs e)
    {
        Response.Redirect("shownotification.aspx");
    }

    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("show_event.aspx");
    }

    protected void Button13_Click(object sender, EventArgs e)
    {
        Response.Redirect("Showadvertisement.aspx");
    }
}
