<% @ Language="JavaScript" %>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM BOMMATERIAL WHERE ID=" + k);
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=mdata");
%>

