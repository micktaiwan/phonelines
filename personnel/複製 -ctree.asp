<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>編輯</td>
<td>班別</td>
<td>姓名</td>
<td>大哥大</td>
<td>家電話</td>
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
      var obj = Server.CreateObject("MATech.Engine");
      obj.SetDB(DB,"sa","engine");
      obj.NewQuery("SELECT * FROM personnel ORDER BY TEAM, NAME");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");

      obj.Generate(0,0);
      obj = "";
%>


</table>