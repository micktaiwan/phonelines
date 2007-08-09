<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   
   obj.Insert("repairlog")
   obj.Execute("UPDATE VISITS SET RESULT='»ÙÃª' WHERE ID=" + String(Request("VISITID")));

   obj = "";
   Response.Redirect("../../l.asp?P=visits&SP=complain&E=1");   
%>
