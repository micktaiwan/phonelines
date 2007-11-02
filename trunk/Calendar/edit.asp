<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<!--#include file="../func.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect("../l.asp");   

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   
   obj.Modify("calendar",k)

   obj = "";
   Response.Redirect("../l.asp?P=cal");   
%>
