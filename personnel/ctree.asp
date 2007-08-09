<table cellspacing="1" cellpadding="2" bgcolor="black" width="1300">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td></td>
<td>編輯</td>
<td width="40">班別</td>
<td>附記</td>
<td>姓名</td>
<td>行動電話</td>
<td>居家電話</td>
<td>職業證號</td>
<td>出生年月日</td>
<td>身分證字號</td>
<td>地址</td>
<td>到職日期</td>
<td>離職日期</td>
<td>備註</td>
<td>刪除</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM personnel WHERE COMPANYID='"+company_id+"' ORDER BY DEPARTURE, TEAM, NAME");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");

      obj.Generate(0,0);
%>


</table>