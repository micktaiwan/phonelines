<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("DELETE FROM pageviews WHERE IP='61.222.7.184' OR MEMBERID=20");

   obj = "";
   Response.Redirect("../l.asp?P=pageviews");   
%>
