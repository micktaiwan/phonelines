<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�s��</td>
<td>���u���</td>
<td>�ӧi���</td>
<td>�q�����</td>
<td>��ê�q��</td>
<td>�p�渹�X</td>
<td>��u���X</td>
<td>�p�渹�X</td>
<td>��ê��]</td>
<td>�Ȥ��}</td>
<td>�Ƶ�</td>
<td>�R��</td>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM repairlog WHERE ISNULL(REPAIRDATE,'')='' ORDER BY REPORTDATE DESC");
      obj.NewTemplate(SitePath+"complains\\tree.wet");

      obj.Generate(0,0);
%>
</table>