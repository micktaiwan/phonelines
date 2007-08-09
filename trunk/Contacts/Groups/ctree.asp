<table BGCOLOR="#000000" cellpadding="3" cellspacing="1">
<tr style="font-weight:bold;" bgcolor="#DDDDDD">
<td>นฮล้</td>
<td>งRฐฃ</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM contactgroups WHERE MEMBERID='"+id+"' ORDER BY ID");
      obj.NewTemplate(SitePath+"contacts\\groups\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
