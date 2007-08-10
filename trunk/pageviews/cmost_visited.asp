<b>Top 2000:</b><br>
<table cellpadding="3" cellspacing="1" bgcolor="black">
<tr bgcolor="#AABBCC">
<td>Page</td>
<td>Count</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT PAGE, COUNT(*) AS C FROM (SELECT TOP 2000 ID, PAGE FROM PAGEVIEWS ORDER BY ID DESC) t GROUP BY PAGE ORDER BY C DESC");
   obj.NewTemplate(SitePath+"pageviews\\most_visited.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>

