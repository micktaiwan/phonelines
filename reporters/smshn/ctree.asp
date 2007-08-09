<table cellpadding="3" cellspacing="1" bgcolor="black">
<tr style="font-weight:bold;" bgcolor="#99AABB">
<td>Edit</td>
<td>Name</td>
<td>HN</td>
<td>Pass</td>
<td>Delete</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM SMSHN WHERE COMPANYID='"+company_id+"' ORDER BY ID");
   obj.NewTemplate(SitePath+"reporters\\smshn\\tree.wet");

   obj.Generate(0,0);
%>
</table>
