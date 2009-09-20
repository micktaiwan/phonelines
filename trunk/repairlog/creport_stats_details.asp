<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc"-->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      origin = String(Request("o"))
      switch(origin) {
         case '1': origin = '123'; break;
         case '2': origin = '128'; break;
         case '3': origin = '客戶'; break;
         case '4': origin = '服務中心'; break;
         case '5': origin = '其它'; break;
         }

      var cond1 = "WHERE visits.TEAM='"+String(Request("t"))+"'";
      cond1 += " AND repairlog.ORIGIN='"+origin+"'";
      cond1 += " AND visits.COMPANYID='"+company_id+"'";
      obj.NewQuery("SELECT 0 AS NEW, repairlog.*, ISNULL(repairlog.VISITID,'') AS VISITID, visits.TEAM, visits.DATE AS VISDATE, visits.ZONE FROM repairlog LEFT OUTER JOIN visits ON repairlog.VISITID=visits.ID "+cond1+" ORDER BY REPORTDATE DESC");
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
