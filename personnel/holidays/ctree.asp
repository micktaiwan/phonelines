<!-- include file="timeline.asp" -->
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>編輯</td>
<td width="40">班別</td>
<td>姓名</td>
<td>類型</td>
<td>事由</td>
<td>職務代理人</td>
<td>請假日起</td>
<td>請假日止</td>
<td>期間</td>
<td>輸入時間</td>
<td>核准人</td>
<td>備註</td>
<td>刪除</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT NAME FROM REPORTERS WHERE ID=holidays.ENTERID) AS ENTERNAME, personnel.TEAM,personnel.NAME, DATEDIFF(day,FROMDATE,TODATE) AS TIME FROM holidays LEFT OUTER JOIN personnel ON holidays.TEAMID=personnel.ID ORDER BY FROMDATE");
      obj.NewTemplate(SitePath+"personnel\\holidays\\tree.wet");

      obj.Generate(0,0);
%>


</table>