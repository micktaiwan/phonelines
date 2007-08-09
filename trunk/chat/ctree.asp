<table cellpadding="2" cellspacing="1" border="0" width="100%">
<tr><td>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 20 *, DATEDIFF(minute,DATE,GETDATE()) AS M,DATEDIFF(hour,DATE,GETDATE()) AS H FROM chat ORDER BY ID DESC");
   obj.NewTemplate(SitePath+"chat\\tree.wet");
   obj.Generate(0,0);
%>
</td>
<td width="100">

<%
   obj.ClearAll();
   obj.NewQuery("SELECT NAME FROM CHATVISITORS ORDER BY ID DESC");
   obj.NewTemplate(SitePath+"chat\\users.wet");
   obj.Generate(0,0);
%>
</td>
</tr>
</table>