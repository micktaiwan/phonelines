<table width="90%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>�s��</td>
<td>�ۼо���</td>
<td>�u�{�s��</td>
<td>�u�{�W��</td>
<td>�������B</td>
<td>�л����B</td>
<td>�t��</td>
<td>�I��</td>
<td>���</td>
<td>����</td>
<td>�}�Ф��</td>
<td>�i������</td>
<td>���i</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM CASES ORDER BY OPENDATE DESC");
   obj.NewTemplate(SitePath+"cases/opendet.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
