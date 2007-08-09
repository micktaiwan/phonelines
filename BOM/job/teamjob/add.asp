<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   Session("TEAMJOBTEAM") = String(Request("TEAM"));
   Session("TEAMJOBPIC") = String(Request("PICTURECODE"));
   Session("TEAMJOBMONEYTYPE") = String(Request("MONEYTYPE"));
   Session("TEAMJOBMATTYPE") = String(Request("MATTYPE"));
   Session("TEAMJOBTYPE") = String(Request("TYPE"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMTEAMJOB");
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=teamjob&SP=add");
%>
