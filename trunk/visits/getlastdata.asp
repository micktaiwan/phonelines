<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      if(admin!="3")
         obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE visits.COMPANYID='"+company_id+"' ORDER BY visits.ID DESC");
      else 
         obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE visits.COMPANYID='"+company_id+"' AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+" ) ORDER BY visits.ID DESC");
      obj.NewTemplate(SitePath+"visits\\tree.wet");

      obj.Generate(0,0);
%>

</table>
