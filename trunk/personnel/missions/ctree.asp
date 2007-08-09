<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>編輯</td>
<td>姓名</td>
<td>事由</td>
<td>起始地點</td>
<td>外出日起</td>
<td>外出日止</td>
<td>外出日時數</td>
<td>輸入時間</td>
<td>核准人</td>
<td>備註</td>
<td>刪除</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT NAME FROM REPORTERS WHERE ID=missions.ENTERID) AS ENTERNAME, personnel.TEAM,personnel.NAME, DATEDIFF(day,FROMDATE,TODATE) AS DAYS FROM missions LEFT OUTER JOIN personnel ON missions.TEAMID=personnel.ID ORDER BY FROMDATE");
      obj.NewTemplate(SitePath+"personnel\\missions\\tree.wet");

      obj.Generate(0,0);
%>


</table>