<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var date = String(Request("D"));
   var zone = String(Request("Z"));
   var sort = String(Request("S"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   rv =  "<table id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>班別</td>";
   rv += "<td>電話號碼</td>";
   rv += "<td>聯單號碼</td>";
   rv += "<td>結果</td>";
   rv += "</tr>";

   
   var sql_zone = ''
   if(zone!='') sql_zone = " visits.zone='"+zone+"' AND ";
   obj.ClearAll();
   var sql = "SELECT DISTINCT visits.ID, visits.team, visits.phone, visits.serial, visits.result FROM "+sectable+" LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE "+sql_zone+" visits.date='"+date+"' ORDER BY ";
   if(sort=="1") sql += "TEAM";
   else sql += "PHONE";
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"gifts\\search\\list.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>


