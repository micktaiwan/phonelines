TOP 50 only
<div id="status">Please wait while loading....</div>
<table id="gifttable" cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>地區</td>
<td>日期</td>
<td>班別</td>
<td>電話號碼</td>
<td>聯單號碼</td>
<td>結果</td>
</tr>

<%
   obj.ClearAll();
   //obj.NewQuery("SELECT *, gifts.name as giftname FROM giftgiven LEFT JOIN visits ON visits.id=giftgiven.visitid LEFT JOIN gifts ON gifts.id=giftgiven.giftid ORDER BY giftgiven.ID DESC");
   obj.NewQuery("SELECT DISTINCT TOP 50 visits.ID, visits.zone, visits.date, visits.team, visits.phone, visits.serial, visits.result FROM giftgiven LEFT JOIN visits ON visits.id=giftgiven.visitid ORDER BY VISITS.DATE DESC, VISITS.TEAM");
   obj.NewTemplate(SitePath+"gifts\\give\\tree.wet");
   obj.Generate(0,0);
%>
</table>
<script>getgifts("normal");</script>
