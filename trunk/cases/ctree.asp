<a target="_blank" href="cases/cprint.asp"><img src="images/link.gif" border="0"> 列印</a><br>
<table width="100%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>編輯</td>
<td>下載</td>
<td>招標機關</td>
<td>工程編號</td>
<td>工程名稱</td>
<td>投標期限</td>
<td>押金</td>
<td>標單費用</td>
<td>開標日期</td>
<td>履約期限</td>
<td>點數<!--預算金額--></td>
<td>公告</td>
</tr><%
   obj.ClearAll();
   //obj.Execute("SET DATEFORMAT ymd");
   obj.NewQuery("SELECT * FROM CASES WHERE BIDLIMIT >= getdate()-1 ORDER BY BIDLIMIT");
   obj.NewTemplate(SitePath+"cases/tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
