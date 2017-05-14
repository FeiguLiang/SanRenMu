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
public partial class admin_page_add : System.Web.UI.Page
{
    OleDbConnection conn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin"] != "adminlogin")
        {
            Response.Redirect("../login.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        db d1 = new db();
        string path = d1.accessdb3();
        OleDbConnection conn = new OleDbConnection(path);
        conn.Open();
        string sql = "insert into page(page_name,page_edit) values(@name,@edit)";
        OleDbCommand comm = new OleDbCommand(sql, conn);
        comm.Parameters.Add("@name", TextBox1.Text);
        comm.Parameters.Add("@edit", FreeTextBox1.Text);
        comm.ExecuteNonQuery();
        conn.Close();
        Response.Write("<script>alert('添加成功')</script>");
    
    }
}
