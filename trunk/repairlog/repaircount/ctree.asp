如果統計等於1電話不會顯示<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AAAAFF" style="text-align:center;">
<td>電話</td>
<td>統計</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM (SELECT repairlog.PHONE, COUNT(repairlog.ID) AS C FROM repairlog WHERE (SELECT visits.companyid FROM visits WHERE visits.id=repairlog.visitid)='"+company_id+"' GROUP BY repairlog.PHONE) X WHERE C > 1 ORDER BY C DESC");
      obj.NewTemplate(SitePath+"repairlog\\repaircount\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>


</table>
