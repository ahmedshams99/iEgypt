using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class edit_comment : Page
{
    SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
    int viewerID;
    //int viewerID = 1;
    int contrID;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        using (cnn)
        {
            if (Session[ID] != null)
            {
                Response.Redirect("Default.aspx");
            }
            viewerID = Convert.ToInt32(Session["ID"]);
            cnn.Open();
            string sqlQ = "SELECT * FROM ( (Original_Content Inner Join Content on Content.ID = Original_Content.ID ) inner join [User] on  [User].ID = Content.contributer_id) inner join Comment on Original_Content.ID = Comment.original_content_id and Comment.Viewer_id="+viewerID;
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlQ, cnn);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            myTable.DataSource = dtbl;
            myTable.DataBind();
        }
    }

    protected void edit_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();

        string date;
        string[] arg = new string[2];
        arg = Convert.ToString((sender as LinkButton).CommandArgument).Split(';');
        int orgContID = Convert.ToInt32(arg[0]);
        date = Convert.ToString(arg[1]);
        string comment = TextBox1.Text;
        if (comment != "")
        {
            string time = "";

            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr1 = cmd2.ExecuteReader())
            {
                time = Convert.ToString(cmd2.Parameters["@out"].Value);
            }
            
            SqlCommand cmd = new SqlCommand("Edit_Comment", cnn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@comment_text", comment));
            cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
            cmd.Parameters.Add(new SqlParameter("@original_content_id", orgContID));
            cmd.Parameters.Add(new SqlParameter("@last_written_time", date));
            cmd.Parameters.Add(new SqlParameter("@updated_written_time", time));

            cmd.ExecuteNonQuery(); ;
            cnn.Dispose();
            cnn.Close();

            Response.Redirect("edit_comment.aspx");
        }
        else
        {
            SqlCommand cmd2 = new SqlCommand("getTime", cnn);
            cmd2.CommandType = System.Data.CommandType.StoredProcedure;
            cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd2.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('insert the new comment info please :(');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG",errorMSG, true);
                cmd2.Dispose();
                rdr2.Close();
            }



        }


    }

    protected void delete_Click(object sender, EventArgs e)
    {
        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        cnn.Open();
        string date;

        string[] arg = new string[2];
        arg = Convert.ToString((sender as LinkButton).CommandArgument).Split(';');
        int orgContID = Convert.ToInt32(arg[0]);
        date = Convert.ToString(arg[1]);

        string comment = TextBox1.Text;
        
        
        
        SqlCommand cmd = new SqlCommand("Delete_Comment", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
        cmd.Parameters.Add(new SqlParameter("@original_content_id", orgContID));
        cmd.Parameters.Add(new SqlParameter("@written_time", date));
        cmd.ExecuteNonQuery(); ;
        cnn.Dispose();
        cnn.Close();
        Response.Redirect("edit_comment.aspx");
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
