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
�z�������s�n�J�t��<br>
<%
   }
else {
var zone = String(Request("ZONE"));
var jt = String(Request("JOBTYPE"));
var datefrom = String(Request("DATEFROM"));
var dateto = String(Request("DATETO"));
Response.Write("<b>�A���M��</b><br>");
var str="";
if(zone!="") {
   str = "ZONE = '"+zone+"'"
   Response.Write("�a��: "+zone+"<br>");
   }
if(jt!="") {
   if(str!="") str += " AND ";
   str += "visits.JOBTYPE = '"+jt+"'"
   Response.Write("�u�@�O: "+jt+"<br>");
   }
if(datefrom!="") {
   if(str!="") str += " AND ";
   str += "DATE >= '"+datefrom+"'"
   Response.Write("�q���: "+datefrom+"<br>");
   }
if(dateto!="") {
   if(str!="") str += " AND ";
   str += "DATE <= '"+dateto+"'"
   Response.Write("����: "+dateto+"<br>");
   }
//if(str!="") str += " AND ";
%>
<br>
<table cellpadding="5" cellspacing="1" bgcolor="black">
<tr bgcolor="white">
<td>�s��</td>
<td>�Z�O</td>
<td>���O</td>
<td>�q�ܸ��X</td>
<td>�p�渹�X</td>
<td>�N�X</td>
<td>�A����]</td>
<td>�Ƶ�</td>
</tr>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.BarcodePath = "D:\\Matech\\Web\\Sites\\PhoneSystem\\Barcode\\Images\\";
   obj.BarcodeFontSize = -16;

   var cond1 = "";
   if(GetSession("PHONEADMIN")=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";

   obj.NewQuery("SELECT visits.*, dispatch.CODE, personnel.CODE AS TCODE FROM visits LEFT OUTER JOIN dispatch ON visits.REASON=dispatch.NAME LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM WHERE visits.RESULT='�A��'  AND "+str+cond1+" ORDER BY visits.TEAM");
   obj.NewTemplate(SitePath+"print\\dispatchprint.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
   obj = "";
%>

<% } %>
</body>
</html>
