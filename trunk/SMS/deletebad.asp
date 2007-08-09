<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect("../l.asp?P=sms");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("DELETE FROM sms WHERE (RESULT!=0 OR TRACKING=21) AND MEMBERID="+GetSession("PHONEID"));
   obj = "";
   Response.Redirect("../l.asp?P=sms&D#msg");   
%>

