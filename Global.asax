<%@ Application Language="C#" %>
<%@   Import   Namespace="System.Data"     %>   
<%@   Import   Namespace="System.Data.OleDb"   %>   
<%@   Import   Namespace="System.Web.Configuration"     %>  
<script runat="server">

    
    OleDbConnection con;
    // <summary> 
    //当有数据时交时，触发事件 
    // </summary> 
    // <param name="sender"> </param> 
    // <param name="e"> </param> 
    protected void Application_BeginRequest(Object sender, EventArgs e)
    {
        //遍历Post参数，隐藏域除外 
        foreach (string i in this.Request.Form)
        {
            if (i == "__VIEWSTATE") continue;
            this.goErr(this.Request.Form[i].ToString());
        }
        //遍历Get参数。 
        foreach (string i in this.Request.QueryString)
        {
            this.goErr(this.Request.QueryString[i].ToString());

        }
    }

    /// <summary> 
    ///SQL注入过滤 
    /// </summary> 
    /// <param name="InText">要过滤的字符串 </param> 
    /// <returns>如果参数存在不安全字符，则返回true </returns> 
    public bool SqlFilter(string InText)
    {
        string word = "and|exec|insert|select|delete|update|chr|mid|master|or|truncate|char|declare|join|cmd";
        if (InText == null)
            return false;
        foreach (string i in word.Split('|'))
        {
            if ((InText.ToLower().IndexOf(i + " ") > -1) || (InText.ToLower().IndexOf(" " + i) > -1))
            {
                return true;
            }
        }
        return false;
    }

    /// <summary> 
    /// 校验参数是否存在SQL字符 
    /// </summary> 
    /// <param name="tm"> </param> 
    private void goErr(string tm)
    {
        if (SqlFilter(tm))
        {
            Response.Write(" <script>window.alert('您输入的数据存在有误参数!');" + " </" + "script>");
        }
    }


    void Application_Start(object sender, EventArgs e) 
    {

        db d1 = new db();
        string path = d1.accessdb();
        con = new OleDbConnection(path);
        Application["countall"]=0;
        Application["online"] = 0;
        int count = 0;
        string sql = "select * from [count]";
        con.Open();
        OleDbCommand com = new OleDbCommand(sql, con);
        OleDbDataReader odr = com.ExecuteReader();
        while (odr.Read())
        {
            count = Convert.ToInt32(odr[1].ToString());
        }
        Application["countall"] = count;
        odr.Close();
        con.Close();

        
        
        // 在应用程序启动时运行的代码

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        db d1 = new db();
        string path = d1.accessdb();
        con = new OleDbConnection(path);
        con.Open();
        string sql = "update [count] set count_all=" + Convert.ToInt32(Application["countall"]);
        OleDbCommand com = new OleDbCommand(sql, con);
        com.ExecuteNonQuery();
        con.Close();
        //  在应用程序关闭时运行的代码

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e) 
    {
        Session.Timeout = 1;
        Application.Lock();
        Application["online"] = Convert.ToInt32(Application["online"]) + 1;
        Application["countall"] = Convert.ToInt32(Application["countall"]) + 1;
        Application.UnLock();
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e) 
    {
        Application.Lock();
        Application["online"] = System.Convert.ToInt32(Application["online"]) - 1;
        Application.UnLock();
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer 
        // 或 SQLServer，则不会引发该事件。

    }
       
</script>
