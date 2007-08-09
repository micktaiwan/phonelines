<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>輸入員</td>
<td>日期</td>
<td>班別</td>
<td>號碼</td>
<td>電話</td>
<td>地區</td>
<td>上下</td>
<td>結果</td>
<td>刪除</td>
</tr>

<%
      obj.ClearAll();
      var k = String(Request("K"));

      obj.NewQuery("SELECT * FROM repairlog where id="+k);
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.Generate(0,0);
%>


</table>
<form action="repairlog/editr.asp?K=<%=k%>" method="post">
結果編輯: <input type="text" name="RESULT" value=""> <input class="button" type="submit" value="OK">
</form>
