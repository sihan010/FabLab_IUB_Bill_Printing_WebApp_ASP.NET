using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void login_Click(object sender, EventArgs e)
    {
        int id = 0;
        String connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=fablab_db;";
        MySqlConnection conn = new MySqlConnection(connStr);
        String query = "SELECT * FROM login_info WHERE user='"+user.Text+"' AND pass='"+pass.Text+"';";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        MySqlDataReader read= cmd.ExecuteReader();
        while(read.HasRows && read.Read())
        {
            id = read.GetInt32(read.GetOrdinal("user"));
            Session["id"] = id;
        }
        if (read.HasRows)
        {
            Response.BufferOutput = true;
            Response.Redirect("Option.aspx",false);
        }

    }
}