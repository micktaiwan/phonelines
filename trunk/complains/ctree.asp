<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>編輯</td>
<td>竣工日期</td>
<td>申告日期</td>
<td>通報單位</td>
<td>障礙電話</td>
<td>聯單號碼</td>
<td>芯線號碼</td>
<td>聯單號碼</td>
<td>障礙原因</td>
<td>客戶住址</td>
<td>備註</td>
<td>刪除</td>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM repairlog WHERE ISNULL(REPAIRDATE,'')='' ORDER BY REPORTDATE DESC");
      obj.NewTemplate(SitePath+"complains\\tree.wet");

      obj.Generate(0,0);
%>
</table>