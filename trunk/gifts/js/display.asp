


not used !!!




<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var visitid = String(Request("V"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var rv = "<table id=\"gifttable\" cellspacing=1 cellpadding=2 bgcolor='black'>";
   rv += "<tr bgcolor='#AABBCC' style='text-align:center;'>";
   rv += "<td>�a��</td>";
   rv += "<td>���</td>";
   rv += "<td>�Z�O</td>";
   rv += "<td>�q�ܸ��X</td>";
   rv += "<td>�p�渹�X</td>";
   rv += "<td>���G</td>";
   rv += "</tr>";
   obj.NewQuery("SELECT DISTINCT visits.ID, visits.ZONE, visits.DATE, visits.TEAM, visits.PHONE, visits.SERIAL, visits.RESULT FROM giftgiven LEFT JOIN visits ON visits.id=giftgiven.visitid WHERE visits.ID='"+visitid+"'");
   obj.NewTemplate(SitePath+"gifts\\give\\tree.wet");
   rv += obj.GenerateString(0,0);
   rv += "</table>";
   Response.Write(escape(rv));

   obj = "";
%>
