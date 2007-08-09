<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("info");
   obj = "";
   Response.Redirect("../l.asp?P=information");
%>
