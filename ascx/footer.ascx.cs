using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
public partial class footer : System.Web.UI.UserControl
{
    OleDbConnection conn;
    public string footer1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            db d1 = new db();
            string path = d1.accessdb();

            OleDbConnection conn = new OleDbConnection(path);
            conn.Open();
            string sql = "select * from config";
            OleDbCommand comm = new OleDbCommand(sql, conn);
            OleDbDataReader odr = comm.ExecuteReader();
            while (odr.Read())
            {
                footer1 = odr[1].ToString();
            }
            odr.Close();
            conn.Close();
        }

    }
}
