<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>工程編號</td>
<td>工作單編號</td>
<td>自編流水</td>
<td>負責班別</td>
<td>報局派工日期</td>
<td>報局竣工日期</td>
<td>送圖請款日期</td>
<td>請款款次</td>
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
