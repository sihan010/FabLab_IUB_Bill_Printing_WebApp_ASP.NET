using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class Option : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count > 0)
        {
            int id1 = (int)(Session["id"]);
            id.Text = "Logged in ID: "+id1.ToString();
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

    protected void go_Click(object sender, EventArgs e)
    {
        if (option.SelectedValue == "1")
        {
            Response.BufferOutput = true;
            Response.Redirect("BankPayment.aspx", false);
        }
        else if(option.SelectedValue == "2")
        {
            Response.BufferOutput = true;
            Response.Redirect("ImprestPayment.aspx", false);
        }
    }

    protected void gen_Click(object sender, EventArgs e)
    {
        if (option1.SelectedValue == "1")
        {
            String connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=fablab_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT voucher FROM bank";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            DropDownList1.DataSource = cmd.ExecuteReader();
            DropDownList1.DataBind();
            conn.Close();
        }
        else if (option1.SelectedValue == "2")
        {
            String connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=fablab_db;";
            MySqlConnection conn = new MySqlConnection(connStr);
            String query = "SELECT voucher FROM imprest";
            MySqlCommand cmd = new MySqlCommand(query, conn);
            conn.Open();
            DropDownList1.DataSource = cmd.ExecuteReader();
            DropDownList1.DataBind();
            conn.Close();
        }
    }

    protected void go1_Click(object sender, EventArgs e)
    {
        string vid="";
        if (option1.SelectedValue == "1")
        {
            vid = DropDownList1.SelectedValue;
            Session["bank"] = vid;
            Response.BufferOutput = true;
            Response.Redirect("OldBank.aspx", false);
        }
        else if (option1.SelectedValue == "2")
        {
            vid = DropDownList1.SelectedValue;
            Session["imprest"] = vid;
            Response.BufferOutput = true;
            Response.Redirect("OldImprest.aspx", false);
        }
    }
}