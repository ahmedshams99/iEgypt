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
    String type;
    String subcategory_name;
    String category_name;
    String link;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] == null)
            Response.Redirect("Default.aspx");
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlDataAdapter da = new SqlDataAdapter("select [type] from Category ", cnn);
        DataTable dtb = new DataTable();
        da.Fill(dtb);                                  
        gvuploadoriginal.DataSource = dtb;
        gvuploadoriginal.DataBind();

        SqlDataAdapter da1 = new SqlDataAdapter("select [name] from Sub_Category ", cnn);
        DataTable dtb1 = new DataTable();
        da1.Fill(dtb1);
        gvsubcategory.DataSource = dtb1;
        gvsubcategory.DataBind();

        SqlDataAdapter da2 = new SqlDataAdapter("select distinct [type] from Category inner join Sub_Category on Sub_Category.category_type = Category.[type]  ", cnn);
        DataTable dtb2 = new DataTable();
        da2.Fill(dtb2);
        gvcategory.DataSource = dtb2;
        gvcategory.DataBind();

        cnn.Close();

    }

    protected void select_Click(object sender, EventArgs e)
    {
      type = Convert.ToString((sender as LinkButton).CommandArgument);
        Label1.Visible = false;
        Label1.Text = type;
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        type = Label1.Text;
        subcategory_name = Label2.Text;
        category_name = Label3.Text;
        link = Label4.Text;

        int contributorid = Convert.ToInt32(Session["ID"]);
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Upload_Oringial_Content", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@type_id", type));
        cmd.Parameters.Add(new SqlParameter("@subcategory_name", subcategory_name));
        cmd.Parameters.Add(new SqlParameter("@category_id", category_name));
        cmd.Parameters.Add(new SqlParameter("@contributor_id", contributorid));
        cmd.Parameters.Add(new SqlParameter("@link", link));
        cmd.ExecuteReader();

        cnn.Close();

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }

    protected void select_Click1(object sender, EventArgs e)
    {
        subcategory_name = Convert.ToString((sender as LinkButton).CommandArgument);
        Label2.Visible = false;
        Label2.Text = subcategory_name;
    }

    protected void select2_Click(object sender, EventArgs e)
    {
        category_name = Convert.ToString((sender as LinkButton).CommandArgument);
        Label3.Visible = false;
        Label3.Text = category_name;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        link = TextBox1.Text;
        Label4.Visible = false;
        Label4.Text = link;
    }
}
