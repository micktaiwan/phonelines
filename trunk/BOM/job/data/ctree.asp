<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>������</td>
<td>�w�w���u��</td>
<td>�u�{�s��</td>
<td>�۽s�y��</td>
<td>���</td>
<td>�u�@��s��</td>
<td>�I�u�a�I</td>
<td>�h����</td>
<td>�h���]</td>
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
