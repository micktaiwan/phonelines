<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>收件日期</td>
<td>預定完工日</td>
<td>工程編號</td>
<td>自編流水</td>
<td>急件</td>
<td>工作單編號</td>
<td>施工地點</td>
<td>退件日期</td>
<td>退件原因</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * from BOMJOB ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"bom\\job\\data\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
