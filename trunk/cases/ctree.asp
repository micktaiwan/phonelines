<a target="_blank" href="cases/cprint.asp"><img src="images/link.gif" border="0"> �C�L</a><br>
<table width="100%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>�s��</td>
<td>�U��</td>
<td>�ۼо���</td>
<td>�u�{�s��</td>
<td>�u�{�W��</td>
<td>��д���</td>
<td>���</td>
<td>�г�O��</td>
<td>�}�Ф��</td>
<td>�i������</td>
<td>�I��<!--�w����B--></td>
<td>���i</td>
</tr><%
   obj.ClearAll();
   //obj.Execute("SET DATEFORMAT ymd");
   obj.NewQuery("SELECT * FROM CASES WHERE BIDLIMIT >= getdate()-1 ORDER BY BIDLIMIT");
   obj.NewTemplate(SitePath+"cases/tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
