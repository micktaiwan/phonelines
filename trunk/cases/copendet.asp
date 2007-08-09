<table width="90%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>編輯</td>
<td>招標機關</td>
<td>工程編號</td>
<td>工程名稱</td>
<td>底價金額</td>
<td>標價金額</td>
<td>廠商</td>
<td>點數</td>
<td>單價</td>
<td>底價</td>
<td>開標日期</td>
<td>履約期限</td>
<td>公告</td>
</tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM CASES ORDER BY OPENDATE DESC");
   obj.NewTemplate(SitePath+"cases/opendet.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
