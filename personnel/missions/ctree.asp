<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�s��</td>
<td>�m�W</td>
<td>�ƥ�</td>
<td>�_�l�a�I</td>
<td>�~�X��_</td>
<td>�~�X���</td>
<td>�~�X��ɼ�</td>
<td>��J�ɶ�</td>
<td>�֭�H</td>
<td>�Ƶ�</td>
<td>�R��</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT NAME FROM REPORTERS WHERE ID=missions.ENTERID) AS ENTERNAME, personnel.TEAM,personnel.NAME, DATEDIFF(day,FROMDATE,TODATE) AS DAYS FROM missions LEFT OUTER JOIN personnel ON missions.TEAMID=personnel.ID ORDER BY FROMDATE");
      obj.NewTemplate(SitePath+"personnel\\missions\\tree.wet");

      obj.Generate(0,0);
%>


</table>