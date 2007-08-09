<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMTEAMMAT");
   obj = "";

   Session("TEAMJOBDATE") = String(Request("DATE"));
   Session("TEAMJOBTEAM") = String(Request("TEAM"));
   Response.Redirect("../../../l.asp?bom=1&P=teammat&SP=add");
%>
