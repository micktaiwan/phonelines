<% @ Language="JavaScript" %>
<!--#include file="../virtual.asp" -->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM messages WHERE ID=" + k);
   obj = "";
   Response.Redirect("../l.asp?P=messages");   
%>

