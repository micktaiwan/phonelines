<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect("../l.asp?P=sms");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   var k = String(Request("K"));
   obj.Execute("UPDATE sms SET DELETED=1 WHERE ID='"+k+"'");
   obj = "";
   Response.Redirect("../l.asp?P=sms");   
%>

