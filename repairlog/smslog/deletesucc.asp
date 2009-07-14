<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("UPDATE sms SET DELETED=1 WHERE TRACKING=0");
   obj = "";
   Response.Redirect("../../l.asp?P=repairlog&SP=smslog&D#msg");   
%>
