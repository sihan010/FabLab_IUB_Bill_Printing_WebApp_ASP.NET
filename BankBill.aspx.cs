using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HiQPdf;
using MySql.Data.MySqlClient;
using System.IO;

public partial class BankBill : System.Web.UI.Page
{
    String paid0 = "", date0 = "", voucher0 = "", project0 = "";
    String description0 = "", initial0 = "", tax0 = "", vat0 = "", total0 = "", word0 = "", eco0 = "",bank0="",cheque0="";
    protected void Page_Load(object sender, EventArgs e)
    {
        String connStr = "datasource=127.0.0.1;port=3306;username=root;password=root;database=fablab_db;";
        MySqlConnection conn = new MySqlConnection(connStr);
        String query = "SELECT MAX(voucher) AS V FROM bank";
        MySqlCommand cmd = new MySqlCommand(query, conn);
        conn.Open();
        MySqlDataReader read = cmd.ExecuteReader();
        while (read.HasRows && read.Read())
        {
            voucher0 = read.GetString(read.GetOrdinal("V"));
        }
        conn.Close();

        String query1 = "SELECT * FROM bank WHERE voucher='" + voucher0 + "';";
        MySqlCommand cmd1 = new MySqlCommand(query1, conn);
        conn.Open();
        MySqlDataReader read1 = cmd1.ExecuteReader();
        while (read1.HasRows && read1.Read())
        {
            paid0 = read1.GetString(read1.GetOrdinal("paid_to"));
            date0 = read1.GetString(read1.GetOrdinal("date"));
            tax0 = read1.GetString(read1.GetOrdinal("tax"));
            vat0 = read1.GetString(read1.GetOrdinal("vat"));
            total0 = read1.GetString(read1.GetOrdinal("total"));
            initial0 = read1.GetString(read1.GetOrdinal("initial"));            
            eco0 = read1.GetString(read1.GetOrdinal("eco_code"));
            description0 = read1.GetString(read1.GetOrdinal("description"));
            project0 = read1.GetString(read1.GetOrdinal("activity"));
            bank0= read1.GetString(read1.GetOrdinal("bank_acc"));
            cheque0= read1.GetString(read1.GetOrdinal("cheque_num"));
        }
        conn.Close();

        taka.Text = initial0;
        voucher.Text = voucher0;
        paid.Text = paid0;
        date.Text = date0;
        project.Text = project0;
        description.Text = description0;
        initial.Text = initial0;
        tax.Text = tax0;
        vat.Text = vat0;
        total.Text = total0;
        initialF.Text = initial0;
        taxF.Text = tax0;
        vatF.Text = vat0;
        totalF.Text = total0;
        bank.Text = bank0;
        cheque.Text = cheque0;
        eco.Text = "Eco.Code - " + eco0;

        word0 = NumberToWords((int)(Double.Parse(total0)));
        word.Text = word0;

        //string fname = "BankBill"+voucher0;

        TextWriter tw = new StringWriter();
        HtmlTextWriter htw = new HtmlTextWriter(tw);
        base.Render(htw);
        string htmlCode = tw.ToString();
        HtmlToPdf htmlToPdfConverter = new HtmlToPdf();
        //htmlToPdfConverter.HiddenHtmlElements = new string[] { "#convertCrtPageDiv" };
        string currentPageUrl = HttpContext.Current.Request.Url.AbsoluteUri;
        byte[] pdfBuffer = htmlToPdfConverter.ConvertHtmlToMemory(htmlCode, currentPageUrl);
        HttpContext.Current.Response.AddHeader("Content-Type", "application/pdf");
        HttpContext.Current.Response.AddHeader("Content-Disposition",
            String.Format("attachment;BankBill; size={0}", pdfBuffer.Length.ToString()));
        HttpContext.Current.Response.BinaryWrite(pdfBuffer);
        HttpContext.Current.Response.End();
    }

    private string NumberToWords(int number)
    {
        if (number == 0)
            return "zero";

        if (number < 0)
            return "minus " + NumberToWords(Math.Abs(number));

        string words = "";
        if ((number / 1000000000) > 0)
        {
            words += NumberToWords(number / 1000000000) + " Billion ";
            number %= 1000000000;
        }

        if ((number / 10000000) > 0)
        {
            words += NumberToWords(number / 10000000) + " Crore ";
            number %= 10000000;
        }

        if ((number / 1000000) > 0)
        {
            words += NumberToWords(number / 1000000) + " Million ";
            number %= 1000000;
        }


        if ((number / 100000) > 0)
        {
            words += NumberToWords(number / 100000) + " Lakh ";
            number %= 100000;
        }


        if ((number / 1000) > 0)
        {
            words += NumberToWords(number / 1000) + " Thousand ";
            number %= 1000;
        }

        if ((number / 100) > 0)
        {
            words += NumberToWords(number / 100) + " Hundred ";
            number %= 100;
        }

        if (number > 0)
        {
            if (words != "")
                words += "and ";

            var unitsMap = new[] { "zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
            var tensMap = new[] { "zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

            if (number < 20)
                words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0)
                    words += "-" + unitsMap[number % 10];
            }
        }

        return words;
    }
}