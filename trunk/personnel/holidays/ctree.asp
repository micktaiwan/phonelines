<!-- include file="timeline.asp" -->
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�s��</td>
<td width="40">�Z�O</td>
<td>�m�W</td>
<td>����</td>
<td>�ƥ�</td>
<td>¾�ȥN�z�H</td>
<td>�а���_</td>
<td>�а����</td>
<td>����</td>
<td>��J�ɶ�</td>
<td>�֭�H</td>
<td>�Ƶ�</td>
<td>�R��</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT NAME FROM REPORTERS WHERE ID=holidays.ENTERID) AS ENTERNAME, personnel.TEAM,personnel.NAME, DATEDIFF(day,FROMDATE,TODATE) AS TIME FROM holidays LEFT OUTER JOIN personnel ON holidays.TEAMID=personnel.ID ORDER BY FROMDATE");
      obj.NewTemplate(SitePath+"personnel\\holidays\\tree.wet");

      obj.Generate(0,0);
%>


</table>