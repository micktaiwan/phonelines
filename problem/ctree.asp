<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>¥N½X</td>
<td>¦WºÙ</td>
<td>§R°£</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM problem ORDER BY CODE");
      obj.NewTemplate(SitePath+"problem\\tree.wet");

      obj.Generate(0,0);
%>


</table>