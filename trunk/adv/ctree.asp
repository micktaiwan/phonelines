<img src="images/point_06.gif"> Each ad banner will be displayed randomly.<br>
<img src="images/point_06.gif"> To disable a banner, 1) delete it or 2) edit it and choose "disable", or 3) put a timelimit with a appropriate date<br>
<img src="images/point_06.gif"> To disable a banner temporarily, just change the fromdate to a future date .<br>
<br>
<%
   nbloop = 18;
%>
<table border="0" cellspacing="1" cellpadding="2" bgcolor="black">
<tr style="font-weight:bold" bgcolor="#AABBCC">
<td colspan="<%=(nbloop+1)%>">廣告時間表</td>
</tr>
<tr style="font-weight:bold"bgcolor="#AABBCC">
<td></td>
<%
   function y2k(number) { return (number < 1000) ? number + 1900 : number; }
   var ndpm = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
   intervall = 24*60*60;
   datefrom = new Date(MyNow());

   for(loop=0;loop<nbloop;loop++) {
      datefromsql = (datefrom.getMonth()+1) + "/" + datefrom.getDate();
      Response.Write("<td>"+datefromsql+"</td>");
      datefrom   = new Date(y2k(datefrom.getYear()),datefrom.getMonth(),datefrom.getDate(),datefrom.getHours(),datefrom.getMinutes(),datefrom.getSeconds() + intervall);
      }
%>
</tr>
<tr bgcolor="#AABBCC">
<td>上:<br>左:</td>
<%
   datefrom = new Date(MyNow());

   for(loop=0;loop<nbloop;loop++) {
      datefromsql = y2k(datefrom.getYear()) + "/" + (datefrom.getMonth()+1) + "/" + datefrom.getDate();

      obj.ClearAll();
      var w = "AND DISABLED=0 AND DATEDIFF(day,'"+datefromsql+"',FROMDATE) <= 0 AND (TIMELIMIT=0 OR DATEDIFF(day,'"+datefromsql+"',TODATE) >= 0)";
      obj.NewQuery("SELECT TOP 1 (SELECT COUNT(*) FROM BANNERS WHERE TYPE=0 AND PLACE=0 "+w+") AS TOPCOUNT, (SELECT COUNT(*) FROM BANNERS WHERE TYPE=0 AND PLACE=1 "+w+") AS RIGHTCOUNT FROM BANNERS ");
      obj.NewTemplate(SitePath+"adv/nb.wet");
      obj.Generate(0,0);
      datefrom   = new Date(y2k(datefrom.getYear()),datefrom.getMonth(),datefrom.getDate(),datefrom.getHours(),datefrom.getMinutes(),datefrom.getSeconds() + intervall);
      }
%>
</tr>
</table>
<br>
<table border=0 cellspacing="0" cellpadding="4">
<tr style="font-weight:bold;text-align:center;">
<td width="100" bgcolor="#AAFFAA">現行廣告</td>
<td width="100" bgcolor="#DDEEFF">未來廣告</td>
<td width="100"  bgcolor="#AAAAAA">登出廣告</td>
</tr>
</table>
<br>
<img id="banner" src="images/no.jpg">
<table cellpadding="3" cellspacing="1" bgcolor="black">
<tr style="font-weight:bold;" bgcolor="#AABBCC">
<td>編輯</td>
<td>提示</td>
<td>曝光數</td>
<td>點數</td>
<td>10<sup>3</sup></td>
<td>最大</td>
<td>連接</td>
<td>位置</td>
<td>開始日期</td>
<td>目前曝光時間</td>
<td>結束日期</td>
<td>圖片</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT *, CASE WHEN NBVIEW=0 THEN '0' ELSE (NBCLICK*1000/NBVIEW) END AS [PERCENT], CASE WHEN TIMELIMIT=1 THEN DATEDIFF(day,GETDATE(),TODATE) ELSE '1' END AS TODATEDIFF, CASE WHEN ((TIMELIMIT=1 AND DATEDIFF(day,GETDATE(),TODATE)<0) OR (MAXVIEW!=0 AND NBVIEW>=MAXVIEW)) THEN '1' ELSE '0' END AS TODATEPASSED, DATEDIFF(day,FROMDATE, GETDATE()) AS FROMDATEDIFF FROM BANNERS ORDER BY DISABLED, TYPE, PLACE, NAME");
   obj.NewTemplate(SitePath+"adv\\tree.wet");
   obj.Generate(0,0);
%>
</table><br>
