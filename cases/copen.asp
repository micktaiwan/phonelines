<table width="90%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>編輯</td>
<td>招標機關</td>
<td>工程編號</td>
<td>工程名稱</td>
<td>投標期限</td>
<td>押金</td>
<td>開標日期</td>
<td>公告</td>
</tr><%
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM CASES WHERE OPENDATE >= getdate()-1 ORDER BY OPENDATE");
   obj.NewTemplate(SitePath+"cases/open.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
