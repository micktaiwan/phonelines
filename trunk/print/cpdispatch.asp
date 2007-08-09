<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
   <title><%=MyNow(1)%></title>
   <link REL=STYLESHEET HREF="../print.css" TYPE="text/css">
</head>
<body topmargin="10" leftmargin="10" marginwidth="10" marginheight="10">
<%
if(!IsLogged("PHONE")) {
%>
您必須重新登入系統<br>
<%
   }
else {
var zone = String(Request("ZONE"));
var jt = String(Request("JOBTYPE"));
var datefrom = String(Request("DATEFROM"));
var dateto = String(Request("DATETO"));
Response.Write("<b>再派清單</b><br>");
var str="";
if(zone!="") {
   str = "ZONE = '"+zone+"'"
   Response.Write("地區: "+zone+"<br>");
   }
if(jt!="") {
   if(str!="") str += " AND ";
   str += "visits.JOBTYPE = '"+jt+"'"
   Response.Write("工作別: "+jt+"<br>");
   }
if(datefrom!="") {
   if(str!="") str += " AND ";
   str += "DATE >= '"+datefrom+"'"
   Response.Write("從日期: "+datefrom+"<br>");
   }
if(dateto!="") {
   if(str!="") str += " AND ";
   str += "DATE <= '"+dateto+"'"
   Response.Write("到日期: "+dateto+"<br>");
   }
//if(str!="") str += " AND ";
%>
<br>
<table cellpadding="5" cellspacing="1" bgcolor="black">
<tr bgcolor="white">
<td>編號</td>
<td>班別</td>
<td>附記</td>
<td>電話號碼</td>
<td>聯單號碼</td>
<td>代碼</td>
<td>再派原因</td>
<td>備註</td>
</tr>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.BarcodePath = "D:\\Matech\\Web\\Sites\\PhoneSystem\\Barcode\\Images\\";
   obj.BarcodeFontSize = -16;

   var cond1 = "";
   if(GetSession("PHONEADMIN")=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";

   obj.NewQuery("SELECT visits.*, dispatch.CODE, personnel.CODE AS TCODE FROM visits LEFT OUTER JOIN dispatch ON visits.REASON=dispatch.NAME LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM WHERE visits.RESULT='再派'  AND "+str+cond1+" ORDER BY visits.TEAM");
   obj.NewTemplate(SitePath+"print\\dispatchprint.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
   obj = "";
%>

<% } %>
</body>
</html>
