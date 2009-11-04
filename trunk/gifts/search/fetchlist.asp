<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var date = String(Request("D"));
   var zone = String(Request("Z"));
   var sort = String(Request("S"));
   var type = String(Request("Y"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

	
   rv =  "<table id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>班別</td>";
   rv += "<td>電話號碼</td>";
   rv += "<td>聯單號碼</td>";
   rv += "<td>結果</td>";
   rv += "<td>MAC</td>";
   rv += "</tr>";

	
   // display the values for team, phones, etc...
   var sql_zone = ''
   if(zone!='') sql_zone = " visits.zone='"+zone+"' AND ";
   obj.ClearAll();
   var sql = "SELECT DISTINCT "+sectable+".ID, visits.team, visits.phone, visits.serial, visits.result, "+sectable+".MAC FROM "+sectable+" JOIN "+maintable+" m ON "+sectable+".MAINID=m.id LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE "+sql_zone+" visits.date='"+date+"'";
   if(type!="") sql +=  " AND m.type="+type;
   sql += " ORDER BY ";
   // (SELECT TOP 1 MAC FROM "+sectable+" WHERE visitid=visits.ID AND MAC!='') as MAC
   if(sort=="1") sql += "TEAM";
   else sql += "PHONE";
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"gifts\\search\\list.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>
