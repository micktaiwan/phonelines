<table width="100%">
<tr><td>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AAAAFF" style="text-align:center;">
<td>�m�W</td>
<td>�έp</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT ISNULL(personnel.NAME,'�����D(�i��R��)')AS NAME, COUNT(sms.ID) AS C FROM sms LEFT OUTER JOIN personnel ON personnel.ID=sms.PERSONNELID WHERE sms.RESULT=0 AND sms.companyid='"+company_id+"' GROUP BY personnel.NAME ORDER BY C DESC");
      obj.NewTemplate(SitePath+"repairlog\\smscount\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>


</table>
</td>
<!--
<td>
�����D(�i��R��)���u���e²�T�O��:<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AAAAFF" style="text-align:center;">
<td>����H</td>
<td>���</td>
<td>����</td>
<td>���A</td>
</tr>

<%
//      obj.ClearAll();
//      obj.NewQuery("SELECT personnel.NAME, sms.* FROM sms LEFT OUTER JOIN personnel ON personnel.ID=sms.PERSONNELID WHERE sms.RESULT=0 AND ISNULL(personnel.NAME,'')='' ORDER BY sms.SENTDATE");
//      obj.NewTemplate(SitePath+"repairlog\\smscount\\test.wet");

//      obj.DirectResponse = 1;
//      obj.Generate(0,0);
%>


</table>
</td>
-->
</tr>
</table>