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
var where = String(Request("WHERE"));

Response.Write("<b>升速鍵檔</b><br>");
Response.Write("<font size=2>"+where+"</font><br>");
%>
<br>
<table cellpadding="5" cellspacing="1" bgcolor="black">
<tr bgcolor="white">
<td></td>
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>輸入員</td>
<%}%>
<td>日期</td>
<td>班別</td>
<td>電話號碼</td>
<!--<td>地區</td>-->
<td>結果</td>
<td>原因</td>
<td>上行</td>
<td>下行</td>
<td>備註</td>
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
