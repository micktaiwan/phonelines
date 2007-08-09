<%
   obj.ClearAll();
   obj.NewQuery("SELECT C/M AS N, M, C FROM (SELECT DATEDIFF(day, MIN(DATE),MAX(DATE)) AS M, COUNT(ID) AS C  FROM pageviews) X");
   obj.NewTemplate(SitePath+"pageviews\\stats2.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
<b>Top 40:</b><br>
<table cellpadding="3" cellspacing="1" bgcolor="black">
<tr bgcolor="#AABBCC">
<td>Page</td>
<td>Count</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 40 PAGE, COUNT(PAGE) AS C FROM pageviews GROUP BY PAGE ORDER BY C DESC");
   obj.NewTemplate(MMSitePath+"pageviews\\stats1.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
