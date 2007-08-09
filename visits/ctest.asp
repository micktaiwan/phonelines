<% if(GetSession("PHONEADMIN")=="0") Response.End();%>
<b>Top 30 :</b><br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      obj.NewQuery("SELECT TOP 30 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, ISNULL(visits.RESULT,'') AS RESULT, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE  FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE RESULT='' ORDER BY visits.DATE DESC");
      obj.NewTemplate(SitePath+"visits\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
