<b>Top 50:</b><br>
<table cellpadding="3" cellspacing="1" bgcolor="black">
<tr bgcolor="#AABBCC">
<td>Date</td>
<td>IP</td>
<td>Name</b></td>
<td>Page</td>
</tr>
<%
   var ip = String(Request("IP"));
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 50 pageviews.*, reporters.NAME, DATEDIFF(month,date,getdate()) AS M, DATEDIFF(day, date, getdate()), DATEDIFF(day, date, getdate()) AS D, DATEDIFF(hour, date, getdate()) AS H, DATEDIFF(minute, date, getdate()) AS MI, DATEDIFF(second, date, getdate()) AS S FROM pageviews LEFT OUTER JOIN reporters ON pageviews.MEMBERID=reporters.ID WHERE IP='"+ip+"' ORDER BY DATE DESC");
   obj.NewTemplate(SitePath+"pageviews\\tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>