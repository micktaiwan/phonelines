<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc"-->
<%
      obj.ClearAll();
      var k = String(Request("K"));
      obj.AddVar(GetSession("PHONEADMIN"));
   var isnew = "CASE WHEN DATEDIFF(hour,REPORTDATE,GETDATE()) < 24 THEN'1' ELSE '0' END AS NEW";
      obj.NewQuery("SELECT "+isnew+", repairlog.*, visits.TEAM, visits.DATE AS VISDATE, visits.ZONE FROM repairlog, visits WHERE VISITID="+k+" AND repairlog.VISITID=visits.ID ORDER BY CORRECTED, REPORTDATE");
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>