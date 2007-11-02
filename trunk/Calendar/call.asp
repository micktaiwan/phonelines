	<table border="0" CELLSPACING=1 CELLPADDING=2 WIDTH="100%">
		<tr BGCOLOR="#8E8E8E">
		<td WIDTH="40%" class="StrongF">&nbsp;Title</td>
		<td WIDTH="15%" class="StrongF">&nbsp;Name</td>
		<td WIDTH="12%" class="StrongF">&nbsp;Date</td>
		</tr>
<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT calendar.*, DATEDIFF(day,CAST(CAST(calendar.YEAR AS VARCHAR(4)) + '/' + CAST(calendar.MONTH AS VARCHAR(2)) + '/' + CAST(calendar.DAY AS VARCHAR(2)) AS DATETIME), GETDATE()) AS OLD, REPORTERS.NAME FROM calendar JOIN REPORTERS ON calendar.MEMBERID=REPORTERS.ID WHERE (calendar.MEMBERID='"+id+"' OR (calendar.COMPANYID='"+company_id+"' AND calendar.PUB=1)) ORDER BY calendar.YEAR, calendar.MONTH, calendar.DAY");
   obj.NewTemplate(SitePath+"calendar\\all.wet");
   obj.Generate(0,0);
%>
</table>