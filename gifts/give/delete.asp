<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../get_vars.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")!= "1" && GetSession("PHONEADMIN")!= "2" && && GetSession("PHONEADMIN")!= "5") {
      Response.Write("You are not an administrator<br>");
      Response.Write(GetSession("PHONEADMIN"));
      Response.End();
      }

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM "+sectable+" WHERE ID=" + k);

   obj = "";

   Response.Redirect("../../l.asp?P=gifts&SP="+Request("SP));
%>

