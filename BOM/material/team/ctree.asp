<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>�Z�O</td>
<td>��Ƥ��</td>
<td>���ƥN�X</td>
<td>���ƦW��</td>
<td>���ƶq</td>
<td>ú�^�ƶq</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT CODE FROM BOMMATERIAL WHERE ID=BOMTEAMMAT.MATERIALID) AS MATCODE, (SELECT NAME FROM BOMMATERIAL WHERE ID=BOMTEAMMAT.MATERIALID) AS MATNAME from BOMTEAMMAT ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"bom\\material\\team\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>