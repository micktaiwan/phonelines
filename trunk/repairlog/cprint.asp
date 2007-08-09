<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
   <title>障礙 <%=MyNow(1)%></title>
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
%>

<%
      var obj = Server.CreateObject("MATech.Engine");
      obj.SetDB(DB,"sa","engine");

      if(GetSession("PHONEADMIN")!="3")
         obj.NewQuery("SELECT repairlog.*, ISNULL(repairlog.VISITID,'') AS VISITID, visits.DATE AS VISDATE, visits.TEAM, visits.ZONE FROM repairlog, visits WHERE ISNULL(CORRECTED,0)!=1 AND visits.ID=repairlog.VISITID ORDER BY REPORTDATE");
      else
         obj.NewQuery("SELECT repairlog.*, ISNULL(repairlog.VISITID,'') AS VISITID, visits.DATE AS VISDATE, visits.TEAM, visits.ZONE FROM repairlog, visits WHERE visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+" ) AND ISNULL(CORRECTED,0)!=1 AND visits.ID=repairlog.VISITID ORDER BY REPORTDATE");
      obj.NewTemplate(SitePath+"repairlog\\print.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
      obj = "";
%>

<% } %>
</body>
</html>
