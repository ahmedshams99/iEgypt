using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    int viewerID ;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session[ID] != null)
        {
            Response.Redirect("Default.aspx");
        }
        viewerID = Convert.ToInt32(Session["ID"]);
    }

    public void createEvent(object sender, EventArgs args)
    {
        Boolean b = CheckBox1.Checked;
        string city = City.Text;
        string description = Description.Text;
        string entartainer = Entartainer.Text;
        string linkVS1 = TextBox1v.Text;
        string linkVS2 = TextBox2v.Text;
        string linkVS3 = TextBox3v.Text;
        string linkVS4 = TextBox4v.Text;
        string linkVS5 = TextBox5v.Text;
        string linkVS6 = TextBox6v.Text;

        string linkPS1 = TextBox1p.Text;
        string linkPS2 = TextBox2p.Text;
        string linkPS3 = TextBox3p.Text;
        string linkPS4 = TextBox4p.Text;
        string linkPS5 = TextBox5p.Text;
        string linkPS6 = TextBox6p.Text;
        string location = Location.Text;

        SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["constr"].ConnectionString); ;

        cnn.Open();

        SqlCommand cmd = new SqlCommand("Viewer_Create_Event", cnn);
        cmd.CommandType = System.Data.CommandType.StoredProcedure;

        DateTime date;
        try
        {
            date= Convert.ToDateTime(Date.Text);

            if (city != "" && description != "" && entartainer != "" && location != "")
            {
                cmd.Parameters.Add(new SqlParameter("@city", city));
                cmd.Parameters.Add(new SqlParameter("@event_date_time", date));
                cmd.Parameters.Add(new SqlParameter("@description", description));
                cmd.Parameters.Add(new SqlParameter("@viewer_id", viewerID));
                cmd.Parameters.Add(new SqlParameter("@entartainer", entartainer));
                cmd.Parameters.Add(new SqlParameter("@location", location));
                //  cmd.Parameters.Add(new SqlParameter("@event_id", location));

                cmd.Parameters.Add("@event_id", System.Data.SqlDbType.Int).Direction = System.Data.ParameterDirection.Output;

                int eventID;
                // execute the command
                try
                {
                    using (SqlDataReader rdr1 = cmd.ExecuteReader())
                    {
                        eventID = Convert.ToInt32(cmd.Parameters["@event_id"].Value);
                    }

                    SqlDataReader rdr;

                    if (linkVS1 != null)
                    {
                        SqlCommand cmd2 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd2.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd2.Parameters.Add(new SqlParameter("@link", linkVS1));
                        rdr = cmd2.ExecuteReader();
                        rdr.Close();

                    }
                    if (linkVS2 != null)
                    {
                        SqlCommand cmd3 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd3.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd3.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd3.Parameters.Add(new SqlParameter("@link", linkVS2));
                        rdr = cmd3.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkVS3 != null)
                    {
                        SqlCommand cmd4 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd4.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd4.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd4.Parameters.Add(new SqlParameter("@link", linkVS3));
                        rdr = cmd4.ExecuteReader();
                        //  SqlDataReader rdr4 = cmd4.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkVS4 != null)
                    {
                        SqlCommand cmd5 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd5.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd5.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd5.Parameters.Add(new SqlParameter("@link", linkVS4));
                        rdr = cmd5.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkVS5 != null)
                    {
                        SqlCommand cmd6 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd6.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd6.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd6.Parameters.Add(new SqlParameter("@link", linkVS5));
                        rdr = cmd6.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkVS6 != null)
                    {
                        SqlCommand cmd7 = new SqlCommand("Viewer_Upload_Event_Video", cnn);
                        cmd7.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd7.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd7.Parameters.Add(new SqlParameter("@link", linkVS6));
                        rdr = cmd7.ExecuteReader();
                        rdr.Close();

                    }
                    //-------------------------------------------------------------------------------
                    if (linkPS1 != null)
                    {
                        SqlCommand cmd8 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd8.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd8.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd8.Parameters.Add(new SqlParameter("@link", linkPS1));
                        rdr = cmd8.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkPS2 != null)
                    {
                        SqlCommand cmd9 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd9.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd9.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd9.Parameters.Add(new SqlParameter("@link", linkPS2));
                        rdr = cmd9.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkPS3 != null)
                    {
                        SqlCommand cmd10 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd10.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd10.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd10.Parameters.Add(new SqlParameter("@link", linkPS3));
                        rdr = cmd10.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkPS4 != null)
                    {
                        SqlCommand cmd11 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd11.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd11.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd11.Parameters.Add(new SqlParameter("@link", linkPS4));
                        rdr = cmd11.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkPS5 != null)
                    {
                        SqlCommand cmd12 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd12.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd12.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd12.Parameters.Add(new SqlParameter("@link", linkPS5));
                        rdr = cmd12.ExecuteReader();
                        rdr.Close();
                    }
                    if (linkPS6 != null)
                    {
                        SqlCommand cmd13 = new SqlCommand("Viewer_Upload_Event_Photo", cnn);
                        cmd13.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd13.Parameters.Add(new SqlParameter("@event_id", eventID));
                        cmd13.Parameters.Add(new SqlParameter("@link", linkPS6));
                        rdr = cmd13.ExecuteReader();
                        rdr.Close();
                    }

                    if (b)
                    {
                        SqlCommand cmd14 = new SqlCommand("Viewer_Create_Ad_From_Event", cnn);
                        cmd14.CommandType = System.Data.CommandType.StoredProcedure;
                        cmd14.Parameters.Add(new SqlParameter("@event_id", eventID));
                        rdr = cmd14.ExecuteReader();
                        rdr.Close();

                    }


                    SqlCommand cmd20 = new SqlCommand("getTime", cnn);
                    cmd20.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd20.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
                    using (SqlDataReader rdr2 = cmd20.ExecuteReader())
                    {
                        string errorMSG = "window.onload=function(){ alert('Done :)');}";
                        ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                        cmd20.Dispose();
                        rdr2.Close();
                    }
                }
                catch
                {
                    SqlCommand cmd20 = new SqlCommand("getTime", cnn);
                    cmd20.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd20.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
                    using (SqlDataReader rdr2 = cmd20.ExecuteReader())
                    {
                        string errorMSG = "window.onload=function(){ alert('insert the info correctly please :(');}";
                        ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                        cmd20.Dispose();
                        rdr2.Close();
                    }
                }

                cnn.Close();
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("getTime", cnn);
                cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                cmd2.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
                using (SqlDataReader rdr2 = cmd2.ExecuteReader())
                {
                    string errorMSG = "window.onload=function(){ alert('insert all the info please :(');}";
                    ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                    cmd2.Dispose();
                    rdr2.Close();
                }
                cnn.Close();
            }
        }
        catch
        {
            SqlCommand cmd20 = new SqlCommand("getTime", cnn);
            cmd20.CommandType = System.Data.CommandType.StoredProcedure;
            cmd20.Parameters.Add("@out", System.Data.SqlDbType.DateTime).Direction = System.Data.ParameterDirection.Output;
            using (SqlDataReader rdr2 = cmd20.ExecuteReader())
            {
                string errorMSG = "window.onload=function(){ alert('insert the date correctly please :(');}";
                ClientScript.RegisterStartupScript(this.GetType(), "errorMSG", errorMSG, true);
                cmd20.Dispose();
                rdr2.Close();
            }
        }
        


        

       
        
    }


    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewerProfile.aspx");
    }
}
