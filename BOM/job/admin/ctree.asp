<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>�u�{�s��</td>
<td>�u�@��s��</td>
<td>�۽s�y��</td>
<td>�t�d�Z�O</td>
<td>�������u���</td>
<td>�������u���</td>
<td>�e�Ͻдڤ��</td>
<td>�дڴڦ�</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT BOMADMIN.*, bomjob.CODE, bomjob.JOBCODE, bomteam.TEAM, bomteam.JOBID AS TEAMCODE \
         FROM BOMADMIN \
         LEFT OUTER JOIN BOMJOB ON bomjob.ID=BOMADMIN.JOBID \
         LEFT OUTER JOIN BOMTEAM ON bomteam.ID=BOMADMIN.TEAMID \
         ORDER BY BOMADMIN.ID DESC");
      obj.NewTemplate(SitePath+"bom\\job\\admin\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
