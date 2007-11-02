<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect(Depth+QS+"welcome");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM calendar WHERE ID = " + k);

   obj = "";
   Response.Redirect("../l.asp?P=cal");   
%>

