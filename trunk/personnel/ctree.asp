<table cellspacing="1" cellpadding="2" bgcolor="black" width="1300">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td></td>
<td>�s��</td>
<td width="40">�Z�O</td>
<td>���O</td>
<td>�m�W</td>
<td>��ʹq��</td>
<td>�~�a�q��</td>
<td>¾�~�Ҹ�</td>
<td>�X�ͦ~���</td>
<td>�����Ҧr��</td>
<td>�a�}</td>
<td>��¾���</td>
<td>��¾���</td>
<td>�Ƶ�</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM personnel WHERE COMPANYID='"+company_id+"' ORDER BY DEPARTURE, TEAM, NAME");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");

      obj.Generate(0,0);
%>


</table>