<table border="0" CELLSPACING=1 CELLPADDING=2 WIDTH="100%">
		<tr BGCOLOR="#8E8E8E">
		<td WIDTH="40%" class="StrongF">&nbsp;<%=lex("title")%></td>
		<td WIDTH="15%" class="StrongF">&nbsp;<%=lex("name")%></td>
		<td WIDTH="12%" class="StrongF">&nbsp;<%=lex("date")%></td>
		</tr>
<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   var where = "";
   if(whatcom==1) where = "(calendar.PUB=1 AND calendar.COMPANYID IN (SELECT COMPANYID FROM MEMBERSHIP WHERE MEMBERID='"+id+"' AND PENDING=0))";
   else where = "(calendar.PUB=1 AND calendar.COMPANYID='"+compid+"')";
   obj.NewQuery("SELECT calendar.*, DATEDIFF(day,CAST(CAST(calendar.YEAR AS VARCHAR(4)) + '/' + CAST(calendar.MONTH AS VARCHAR(2)) + '/' + CAST(calendar.DAY AS VARCHAR(2)) AS DATETIME), GETDATE()) AS OLD, members.NAME FROM calendar JOIN members ON calendar.MEMBERID=members.ID WHERE (calendar.MEMBERID='"+id+"' OR "+where+" ) AND (calendar.TITLE LIKE '%"+s+"%' OR calendar.DESCR LIKE '%"+s+"%') ORDER BY calendar.YEAR DESC, calendar.MONTH DESC, calendar.DAY DESC");
   obj.NewTemplate(SitePath+"calendar\\all.wet");
   obj.Generate(0,0);
%>
</table>