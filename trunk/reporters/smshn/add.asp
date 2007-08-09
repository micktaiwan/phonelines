<%@ language="javascript"%>
<!--#include file="../../func.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("SMSHN");
   obj = "";
   Response.Redirect("../../l.asp?P=reporters&SP=smshn");
%>
