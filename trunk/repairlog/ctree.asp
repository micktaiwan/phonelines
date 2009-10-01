<%
//受理日期 is the date when the data is confirmed (it is CONFIRMDATE in the DB)
//申告日期 is in fact the INSERTDATE, but is REPORTDATE IN THE DB
%>

<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc"-->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
      else if(admin=="4") cond1 = " AND visits.TEAM='"+GetSession("PHONECODE")+"'";
      var isnew = "CASE WHEN DATEDIFF(hour,REPORTDATE,GETDATE()) < 24 THEN'1' ELSE '0' END AS NEW";
      cond1 += " AND visits.COMPANYID='"+company_id+"'"
      obj.NewQuery("SELECT "+isnew+", repairlog.*, ISNULL(repairlog.VISITID,'') AS VISITID, visits.TEAM, visits.DATE AS VISDATE, visits.ZONE FROM repairlog LEFT OUTER JOIN visits ON repairlog.VISITID=visits.ID WHERE ISNULL(CORRECTED,0)=0 "+cond1+" ORDER BY CONFIRMDATE DESC");
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
