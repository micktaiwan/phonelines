<table width="100%" bgcolor="#AAAAA0" cellpadding="2" cellspacing="1">
<tr bgcolor="#DDDDD0" style="font-weight:bold;">
<td>Title</td><td>Name</td><td>Date</td><td width="20"></td><td width="20"></td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 20 * FROM info LEFT OUTER JOIN REPORTERS ON REPORTERS.ID=INFO.MEMBERID where datediff(day,date,getdate()) < 100 AND info.COMPANYID='"+company_id+"' ORDER BY info.DATE DESC");
   obj.NewTemplate(SitePath+"info\\editl.wet");
   obj.Generate(0,0);
%>
</table>
