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
public partial class ascx_about : System.Web.UI.UserControl
{
    OleDbConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            show();
        }

    }
    private void show()
    {
        db d1 = new db();
        string path = d1.accessdb();
        conn = new OleDbConnection(path);
        string sql="select * from page where page_id=3";
        conn.Open();
        OleDbCommand comm=new OleDbCommand(sql,conn);
        OleDbDataReader odr=comm.ExecuteReader();
        while(odr.Read())
        {
            Label1.Text=odr[2].ToString();
        }
        odr.Close();
        conn.Close();
    }

}
