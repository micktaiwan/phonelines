<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>��J��</td>
<td>���</td>
<td>�Z�O</td>
<td>���X</td>
<td>�q��</td>
<td>�a��</td>
<td>�W�U</td>
<td>���G</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      var k = String(Request("K"));

      obj.NewQuery("SELECT * FROM repairlog where id="+k);
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.Generate(0,0);
%>


</table>
<form action="repairlog/editr.asp?K=<%=k%>" method="post">
���G�s��: <input type="text" name="RESULT" value=""> <input class="button" type="submit" value="OK">
</form>
