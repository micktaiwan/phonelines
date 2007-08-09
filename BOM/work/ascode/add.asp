<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMASCODE");
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=ascode&SP=add");
%>
