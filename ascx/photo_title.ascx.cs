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
public partial class ascx_photo_title : System.Web.UI.UserControl
{
    OleDbConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            fengye();
        }
    }
    private void fengye()
    {
        db d1 = new db();
        string path = d1.accessdb();
        conn = new OleDbConnection(path);
        string sql = "select * from type where type_type=2";
        OleDbDataAdapter oda = new OleDbDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        oda.Fill(ds, "title");
        Repeater1.DataSource = ds.Tables[0].DefaultView;
        Repeater1.DataBind();
        conn.Close();
    }
}
