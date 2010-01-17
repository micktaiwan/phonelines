<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var date = String(Request("D"));
   var zone = String(Request("Z"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   rv =  "<table id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>¯Z§O</td>";
   rv += "</tr>";
   obj.ClearAll();
   var sql = "SELECT DISTINCT visits.team FROM "+sectable+" LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE visits.date='"+date+"'";
   if(zone!='') sql += " AND visits.zone='"+zone+"'";
   sql += " ORDER BY TEAM"
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"gifts\\search\\daily.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>
