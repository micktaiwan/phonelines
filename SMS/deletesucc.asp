<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect("../l.asp?P=sms");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("UPDATE sms SET DELETED=1 WHERE TRACKING=0 AND MEMBERID='"+GetSession("PHONEID")+"'");
   obj = "";
   Response.Redirect("../l.asp?P=sms&D#msg");   
%>

