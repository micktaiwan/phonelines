Top 10¡G<br><br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="../tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";

      obj.NewQuery("SELECT TOP 10 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, ISNULL(visits.RESULT,'') AS R, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE  FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE RESULT='"+result+"' "+cond1+" ORDER BY visits.DATE DESC");
      obj.NewTemplate(SitePath+"visits\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
