<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AAAAFF" style="text-align:center;">
<td>�m�W</td>
<td>�έp</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT ISNULL(personnel.NAME,'�����D(�i��R��)')AS NAME, COUNT(sms.ID) AS C FROM sms LEFT OUTER JOIN personnel ON personnel.ID=sms.PERSONNELID WHERE sms.RESULT=0 AND sms.SENTDATE >= FLOOR(CAST(GetDate() AS FLOAT)) AND sms.SENTDATE < FLOOR(CAST(GetDate() AS FLOAT)+1) AND sms.companyid='"+company_id+"' GROUP BY personnel.NAME ORDER BY C DESC");
      obj.NewTemplate(SitePath+"repairlog\\smscount\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>


</table>
