<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect("../expired.html");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("DELETE FROM calendar WHERE DATEDIFF(day,CAST(CAST(YEAR AS VARCHAR)+'/'+CAST(MONTH AS VARCHAR)+'/'+CAST(DAY AS VARCHAR) AS DATETIME), GETDATE()) > 0");
   obj = "";
   Response.Redirect("../l.asp?P=cal");
%>

