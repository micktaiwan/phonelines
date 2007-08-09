<%@ language="javascript"%>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("missions");

   obj = "";
   Response.Redirect("../../l.asp?P=personnel&SP=missions");
%>
