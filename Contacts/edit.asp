<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   
   obj.Modify("contacts",k)

   obj = "";
   Response.Redirect("../l.asp?P=contacts");   
%>
