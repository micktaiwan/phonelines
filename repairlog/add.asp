<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("repairlog");
   var k = String(Request("K"));
   obj.Execute("UPDATE VISITS SET RESULT='»ÙÃª' WHERE ID=" + k);

   
   Session("RESP") = String(Request("RESPONSIBLE"));
   Session("DATE") = String(Request("DATE"));
   Session("ZONE") = String(Request("ZONE"));
   Session("TEAM") = String(Request("TEAM"));
   Session("AMPM") = String(Request("AMPM"));

   obj = "";
   Response.Redirect(Depth+QS+"repairlog&E=1");
%>
