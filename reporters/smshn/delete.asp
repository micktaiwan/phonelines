<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")!= "5")    Response.Redirect("../../l.asp?P=reporters&SP=smshn");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("UPDATE REPORTERS SET SMSHNID=0 WHERE SMSHNID="+k);
   obj.Execute("DELETE FROM smshn WHERE ID=" + k);
   obj = "";
   Response.Redirect("../../l.asp?P=reporters&SP=smshn");
%>

