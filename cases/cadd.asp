<script language="javascript">

   function vercaseform() {
      
      document.casesform.submit();
      
      }

</script>


<form name="casesform" action="cases/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>招標機關: </td><td><input type="text" name="ORGAN" value=""> 文字</td></tr>
<tr><td>工程名稱: </td><td><input type="text" name="NAME" value=""> 文字</td></tr>
<tr><td>工程編號: </td><td><input type="text" name="NUMBER" value=""> 文字</td></tr>
<tr><td>開標日期: </td><td><input type="text" name="OPENDATE" value="<%=MyNow(3)%>"> 日期</td></tr>
<tr><td>投標期限: </td><td><input type="text" name="BIDLIMIT" value="<%=MyNow(0)%>"> 日期</td></tr>
<tr><td>履約期限: </td><td><input type="text" name="APPOINTLIMIT" value=""> 文字</td></tr>
<tr><td>押金額度: </td><td><input type="text" name="DEPOSIT" value=""> 整數</td></tr>
<tr><td>標單費用: </td><td><input type="text" name="CHARGES" value=""> 整數</td></tr>
<tr><td>預算金額: </td><td><input type="text" name="BUDGET" value=""> 整數</td></tr>
<tr><td>底價金額: </td><td><input type="text" name="BASEPRICE" value=""> 整數</td></tr>
<tr><td>標價金額: </td><td><input type="text" name="PRICE" value=""> 整數</td></tr>
<tr><td>核定點數: </td><td><input type="text" name="UNITCOUNT" value=""> 整數</td></tr>
<tr><td>得標單價: </td><td><input type="text" name="UNIT" value=""> 實數</td></tr>
<tr><td>底價單價: </td><td><input type="text" name="UNITBASE" value=""> 實數</td></tr>
<tr><td>得標廠商: </td><td><input type="text" name="FACTORY" value=""> 文字</td></tr>
<tr><td>公告日期: </td><td><input type="text" name="ANNOUNCEDATE" value="<%=MyNow(0)%>"> 日期</td></tr>
<tr><td>下載: </td><td><input type="radio" name="DL" value="0" checked> 否 <input type="radio" name="DL" value="1"> 是</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="vercaseform();" value="增加"></td></tr>
</table>
</form>
<%
var e = String(Request("E"));
if(e=="1") Response.Write("<strong>OK</strong><br>");
%>
最後的資料:<br>
<table width="90%" cellpadding="3" cellspacing="1" bgcolor="#000000">
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
<td>預算金額</td>
<td>公告</td>
</tr><%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 10 * FROM CASES ORDER BY INSERTDATE DESC");
   obj.NewTemplate(SitePath+"cases/tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>