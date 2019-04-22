using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebSite5_ViewerProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        SqlDataReader dataReader = new SqlCommand("Select * from [Contributor] where ID=" + Session["ID"],cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("ContributorProfile.aspx");
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [Staff] where ID=" + Session["ID"],cnn).ExecuteReader();
        dataReader.Read();
        if (dataReader.HasRows)
            Response.Redirect("StaffProfile.aspx");
        dataReader.Close();
       
        dataReader = new SqlCommand("Update [User] set deactivation_date=null where ID=" + Session["ID"].ToString() + ";", cnn).ExecuteReader();
        dataReader.Close();
        dataReader = new SqlCommand("Select * from [User] INNER JOIN Viewer on [User].ID=Viewer.ID where [User].ID=" + Session["ID"], cnn).ExecuteReader();
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
        Response.Redirect("EditViewer.aspx");
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

    protected void createEvent(object sender, EventArgs e)
    {
        Response.Redirect("create event.aspx");
    }

    protected void ApplyExistingReq(object sender, EventArgs e)
    {
        Response.Redirect("Apply_for_Existing_request.aspx");
    }

    protected void ApplyrNewReq(object sender, EventArgs e)
    {
        Response.Redirect("Apply_for_new_request.aspx");
    }

    protected void DeleteReq(object sender, EventArgs e)
    {
        Response.Redirect("Delete_new_request.aspx");
    }

    protected void ReviewOrigCont(object sender, EventArgs e)
    {
        Response.Redirect("Review_original_content.aspx");
    }

    protected void WriteComment(object sender, EventArgs e)
    {
        Response.Redirect("comment.aspx");
    }

    protected void EditDeleteCommment(object sender, EventArgs e)
    {
        Response.Redirect("edit_comment.aspx");
    }

    protected void CreateAD(object sender, EventArgs e)
    {
        Response.Redirect("create_publicity_ad.aspx");
    }

    protected void EditDeleteAD(object sender, EventArgs e)
    {
        Response.Redirect("edit_ad.aspx");
    }

    protected void ShowNewContent(object sender, EventArgs e)
    {
        Response.Redirect("show_new_content.aspx");
    }
}
