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
var where = String(Request("WHERE"));

Response.Write("<b>�ɳt����</b><br>");
Response.Write("<font size=2>"+where+"</font><br>");
%>
<br>
<table cellpadding="5" cellspacing="1" bgcolor="black">
<tr bgcolor="white">
<td></td>
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>��J��</td>
<%}%>
<td>���</td>
<td>�Z�O</td>
<td>�q�ܸ��X</td>
<!--<td>�a��</td>-->
<td>���G</td>
<td>��]</td>
<td>�W��</td>
<td>�U��</td>
<td>�Ƶ�</td>
</tr>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   //var cond1 = "";
   //if(GetSession("PHONEADMIN")=="3") cond1 = " AND visitsb.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
   obj.NewQuery("SELECT visitsb.* FROM visitsb WHERE "+where);
   obj.NewTemplate(SitePath+"print\\visitsbprint.wet");
   obj.DirectResponse = 1;
   obj.AddVar(GetSession("PHONEADMIN"));
   obj.Generate(0,0);
   obj = "";
%>

<% } %>
</body>
</html>
