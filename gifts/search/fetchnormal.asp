<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var date = String(Request("D"));
   var team = und(String(Request("T")));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   rv =  "<table class=\"sortable\" id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>地區</td>";
   rv += "<td>日期</td>";
   rv += "<td>班別</td>";
   rv += "<td>電話號碼</td>";
   rv += "<td>聯單號碼</td>";
   rv += "<td>結果</td>";
   rv += "<td>工作別</td>";
   rv += "</tr>";
   obj.ClearAll();
	var sql = "SELECT DISTINCT visits.ID, visits.zone, visits.date, visits.team, visits.phone, visits.serial, visits.result, visits.jobtype FROM "+sectable+" LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE visits.date='"+date+"'";
	if(team != "") sql += " AND visits.team='"+team+"'"
   sql += " ORDER BY VISITS.TEAM";
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"gifts\\search\\tree.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>
