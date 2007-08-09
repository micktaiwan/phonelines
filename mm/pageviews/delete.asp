<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(!IsLogged("ORGAN")) Response.Redirect(Depth+QS+"welcome");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("organizer","sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM logins WHERE ID = " + k);

   obj = "";
   Response.Redirect("../l.asp?P=logins&SP=all");   
%>

