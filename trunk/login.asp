<%@ language="javascript"%>
<!--#include file="virtual.asp" -->
<!--#include file="func.asp" -->
<%
   var l = String(Request("L"));
   var p = String(Request("P"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   obj.NewQuery("SELECT TOP 1 ID FROM REPORTERS WHERE CODE='" + l + "' AND PASS='" + p + "'");
   obj.NewTemplate(SitePath+"id.wet");
   k = obj.GenerateString(0,0);
   if(k=="") Session("PHONEID") = "undefined";
   else {
      obj.FillSession("REPORTERS",k, "PHONE");
      var date = MyNow(1);
      var ip = Request.ServerVariables("REMOTE_ADDR");
            
      var sql = "INSERT INTO LOGINS (REPORTERID, DATE, IP, NAME) VALUES ('";
      sql += k+"','"+date+"','"+ip+"','"+GetSession("PHONENAME")+"')";
      obj.EXECUTE(sql);

      //sql = "UPDATE MEMBERS SET LASTIP='"+ip+"' WHERE ID="+k;
      //obj.EXECUTE(sql);
      if(String(Request("AutoLogin"))=="1") {
         Response.Cookies("PHONE")("login")=k;
         Response.Cookies("PHONE").Expires="May 10,2020"
         }
/*
    	var cfile = Server.Mappath("login.txt");
     	var fs = Server.CreateObject("Scripting.FileSystemObject");
     	var out = fs.OpenTextFile(cfile,8,true);
     	out.WriteLine(GetSession("PHONENAME") + " " +"\t***\t" + Date());
      out = "";
      fs = "";
*/
      
      }
   //Response.Write(k+"<br>");
   //Response.Write(Session("PHONEID")+"<br>");
   //Response.Write(Session("PHONENAME")+"<br>");
   obj = "";
   if(GetSession("PHONEID") == "undefined")
      Response.Redirect("clogin.asp");
   else
      Response.Redirect("l.asp?"+GetSession("PHONEQS"));   
%>
