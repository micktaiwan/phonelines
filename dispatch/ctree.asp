<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�N�X</td>
<td>�W��</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM dispatch ORDER BY CODE");
      obj.NewTemplate(SitePath+"dispatch\\tree.wet");

      obj.Generate(0,0);
%>


</table>