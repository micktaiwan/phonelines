<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   var date = String(Request("D"));
   var team = String(Request("T"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   rv =  "<table class=\"sortable\" id=\"gifttable\" cellspacing=\"1\" cellpadding=\"2\" bgcolor=\"black\">";
   rv += "<tr bgcolor=\"#AABBCC\" style=\"text-align:center;\">";
   rv += "<td>�a��</td>";
   rv += "<td>���</td>";
   rv += "<td>�Z�O</td>";
   rv += "<td>�q�ܸ��X</td>";
   rv += "<td>�p�渹�X</td>";
   rv += "<td>���G</td>";
   rv += "</tr>";
   obj.ClearAll();
   obj.NewQuery("SELECT DISTINCT visits.ID, visits.zone, visits.date, visits.team, visits.phone, visits.serial, visits.result FROM "+sectable+" LEFT JOIN visits ON visits.id="+sectable+".visitid WHERE visits.team='"+team+"' AND visits.date='"+date+"' ORDER BY VISITS.TEAM");
   obj.NewTemplate(SitePath+"gifts\\search\\tree.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>"
   Response.Write(escape(rv));
   obj = "";
%>


