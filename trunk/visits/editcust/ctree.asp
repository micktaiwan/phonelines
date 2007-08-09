<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = "WHERE visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";

      obj.NewQuery("SELECT TOP 10 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, personnel.PHONES FROM visits LEFT OUTER JOIN personnel ON personnel.TEAM=visits.TEAM "+cond1+" ORDER BY DATE DESC");
      obj.NewTemplate(SitePath+"visits\\editcust\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
