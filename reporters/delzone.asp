<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM repzones WHERE ID=" + k);

   obj = "";
   var rep = String(Request("REP"));
   Response.Redirect("../l.asp?P=reporters&SP=edit&K="+rep);   
%>

