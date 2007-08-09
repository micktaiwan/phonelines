<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("DELETE FROM sms WHERE (RESULT!=0 OR TRACKING=21)");
   obj = "";
   Response.Redirect("../../l.asp?P=repairlog&SP=smslog&D#msg");   
%>

