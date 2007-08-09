<%@ language="javascript"%>
<!--#include file="func.asp"-->
<!--#include file="virtual.asp"-->
<%
   Session("AUTOLOGINUSED") = "1";
/* not secure
   k = String(Request.Cookies("PHONE")("login"));
   if(k != "undefined") {
      var obj = Server.CreateObject("MATech.Engine");
      obj.SetDB("phone","sa","engine");
      obj.FillSession("REPORTERS",k, "PHONE");
      var date = MyNow(1);
      var ip = Request.ServerVariables("REMOTE_ADDR");
            
      var sql = "INSERT INTO LOGINS (REPORTERID, DATE, IP, NAME) VALUES ('";
      sql += k+"','"+date+"','"+ip+"','"+GetSession("PHONENAME")+"')";
      obj.EXECUTE(sql);

      obj = "";
      }
   Response.Redirect("l.asp?"+GetSession("PHONEQS"));

*/
   Response.Redirect("clogin.asp");
%>
