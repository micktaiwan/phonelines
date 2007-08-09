<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>班別</td>
<td>領料日期</td>
<td>材料代碼</td>
<td>材料名稱</td>
<td>實領數量</td>
<td>繳回數量</td>
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