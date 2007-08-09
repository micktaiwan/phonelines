<%@ language="javascript"%>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(!IsLogged("PHONE")) Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   obj.Insert("reportergroups");

   obj = "";

   var name = String(Request("Name"));

/*
   var mwebmail = Server.CreateObject("MWebMail.WebMail");
   mwebmail.SendHost = "202.159.185.4";
   mwebmail.MailTo = "mickael@easyplay.com.tw";
   mwebmail.MailFrom = "PHONE <mickael@easyplay.com.tw>";
   mwebmail.MailSubject = "[PHONE] New contact group: " + name;
   mwebmail.Send();
   mwebmail = "";
*/
   
   Response.Redirect("../../l.asp?P=reporters&SP=groups");
%>
