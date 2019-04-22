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
        int contributor_id;
        contributor_id = Convert.ToInt32(Session["ID"]);    

        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Receive_New_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter("@contributor_id", contributor_id));
        cmd.Parameters.Add("@can_receive ", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;
        Boolean can_receive = false;
        using (SqlDataReader rdr = cmd.ExecuteReader())                          // to get output
        {
            can_receive = Convert.ToBoolean(cmd.Parameters["@can_receive "].Value);
        }

        if (can_receive)
        {
            string queryString = "SELECT id, specified , information FROM New_Request where  (New_Request.contributer_id is null) ";
            SqlDataAdapter da = new SqlDataAdapter(queryString, cnn);
            da.SelectCommand.Parameters.Add("@contributor_id", SqlDbType.Int).Value = contributor_id;
            DataTable dtb = new DataTable();
            da.Fill(dtb);                                  
            gvRequest.DataSource = dtb;
            gvRequest.DataBind();
        }
        else                 
        {
            Response.Write("You have 3 unhandled New Requests.");
        }

        cnn.Close();

    }

    protected void reject_Click(object sender, EventArgs e)
    {
        int request_id = int.Parse((sender as LinkButton).CommandArgument);
        int contributor_id;
        contributor_id = Convert.ToInt32(Session["ID"]);
        int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Respond_New_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add("@contributor_id", SqlDbType.Int).Value = contributor_id;
        cmd.Parameters.Add("@accept_status", SqlDbType.Int).Value = 0;
        cmd.Parameters.Add("@request_id", SqlDbType.Int).Value = request_id;
        cmd.ExecuteReader();

        cnn.Close();

    }

    protected void accept_Click(object sender, EventArgs e)
    {
        int request_id = int.Parse((sender as LinkButton).CommandArgument);
        int contributor_id;
        contributor_id = Convert.ToInt32(Session["ID"]);                                                    
        int ID = Convert.ToInt32((sender as LinkButton).CommandArgument);
        string connetionString;
        SqlConnection cnn;
        connetionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        cnn = new SqlConnection(connetionString);
        cnn.Open();

        SqlCommand cmd = new SqlCommand("Respond_New_Request", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        cmd.Parameters.Add("@contributor_id", SqlDbType.Int).Value = contributor_id;        
        cmd.Parameters.Add("@accept_status", SqlDbType.Int).Value = 1;
        cmd.Parameters.Add("@request_id", SqlDbType.Int).Value = request_id;

        cmd.ExecuteReader();

        cnn.Close();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ContributorProfile.aspx");
    }
}
