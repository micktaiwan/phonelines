<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>�u�{�s��</td>
<td>�u�@��s��</td>
<td>�t�d�Z�O</td>
<td>�Z������</td>
<td>�Z��Ϥ��</td>
<td>�۽s�y��</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT bomteam.*, bomdata.IDNUMBER, bomjob.JOBCODE, bomjob.CODEB \
         FROM BOMTEAM \
         LEFT OUTER JOIN BOMDATA ON bomdata.ID=bomteam.WORKID \
         LEFT OUTER JOIN BOMJOB ON bomjob.ID=bomteam.JOBID \
         ORDER BY bomteam.ID DESC");
      obj.NewTemplate(SitePath+"bom\\job\\team\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
