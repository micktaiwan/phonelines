<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   
   obj.Modify("cancel",k)

   obj = "";
   Response.Redirect("../l.asp?P=cancel");   
%>
