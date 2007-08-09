<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>請領日期</td>
<td>料單編號</td>
<td>局料代碼</td>
<td>材料名稱</td>
<td>工程編號</td>
<td>請領數量</td>
<td>實領數量</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, \
         (SELECT CODE FROM BOMMATERIAL WHERE ID=BOMREQUEST.MATERIALID) AS MATCODE, \
         (SELECT NAME FROM BOMMATERIAL WHERE ID=BOMREQUEST.MATERIALID) AS MATNAME, \
         (SELECT IDNUMBER FROM BOMDATA WHERE ID=BOMREQUEST.WORKID) AS WORKCODE \
         from BOMrequest ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"bom\\material\\request\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>