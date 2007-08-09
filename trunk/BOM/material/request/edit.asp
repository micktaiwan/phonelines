<%@ language="javascript"%>
<!--#include file="../../../virtual.asp"-->
<%
   var k = String(Request("K"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Modify("BOMrequest",k);
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=request");
%>
