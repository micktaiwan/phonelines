<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>�л���</td>
<td>�Ƴ�s��</td>
<td>���ƥN�X</td>
<td>���ƦW��</td>
<td>�u�{�s��</td>
<td>�л�ƶq</td>
<td>���ƶq</td>
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