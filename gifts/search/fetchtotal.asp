<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var zone  = String(Request("Z"));
   var date1 = String(Request("DA"));
   var date2 = String(Request("DB"));
   var team  = und(String(Request("T")));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   rv =  "<table id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>¤é´Á</td>";
   rv += "</tr>";
   obj.ClearAll();
   var sql = "SELECT DISTINCT visits.date, visits.team FROM "+sectable+" LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE visits.date BETWEEN '"+date1+"' AND '"+date2+"'";
   if(team != '') sql += " AND visits.TEAM='"+team+"'";
   if(zone != '') sql += " AND visits.zone='"+zone+"'";
   sql += " ORDER BY TEAM"
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"gifts\\search\\total.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>
