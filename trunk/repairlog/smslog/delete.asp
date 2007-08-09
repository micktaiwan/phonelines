<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("UPDATE sms SET DELETED=1 WHERE ID = " + k);
   obj = "";
   Response.Redirect("../../l.asp?P=repairlog&SP=smslog");
%>

