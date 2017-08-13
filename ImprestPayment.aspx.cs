using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


public partial class ImprestPayment : System.Web.UI.Page
{
    String total1 = "", initial1="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            int id1 = (int)(Session["id"]);
            id.Text = "Logged in ID: " + id1.ToString();
        }
        else
        {
            Response.BufferOutput = true;
            Response.Redirect("Default.aspx", false);
        }
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.BufferOutput = true;
        Response.Redirect("Default.aspx", false);
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        try
        {
            String paid1 = "", activity1 = "", economic1 = "", description1 = "", vat1 = "0", tax1 = "0", date1 = "";
            paid1 = paid.Text;
            initial1 = initial.Text;
            activity1 = activity.Text;
            economic1 = economic.Text;
            description1 = description.Text;
            vat1 = vat.Text;
            tax1 = tax.Text;            
            date1 = DateTime.Now.ToString("dd/MM/yyyy hh:mm tt");
            totalCal(vat1, tax1);

            String connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=fablab_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "INSERT INTO imprest(paid_to,date,tax,vat,total,initial,eco_code,description,activity) " +
                "VALUES('" + paid1 + "','" + date1 + "','" + tax1 + "','" + vat1 + "','" + total1 + "','" + initial1 + "','" + economic1 + "','" + description1 + "','" + activity1 + "');";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            MySqlDataReader read = cmd.ExecuteReader();
            conn.Close();
            Label8.Text = "Saved to Database. Downloading PDF";
        }
        catch(Exception ex)
        {
            op.Text = ex.Message;
        }

        Response.BufferOutput = true;
        Response.Redirect("ImprestBill.aspx", false);

        
    }

    private void totalCal(string v , string t)
    {
        double vat, tax, total,ini;
        vat = Double.Parse(v);
        tax = Double.Parse(t);
        ini = Double.Parse(initial1);
        Double temp1 = (ini * vat) / 100;
        Double temp2 = (ini * tax) / 100;
        total = ini - temp1 - temp2;
        total1 = total.ToString();
    }
}