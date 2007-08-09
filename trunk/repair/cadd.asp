<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"名字")) return false;
	form.submit();
	return true;
   
   }

</script>

<form name="addform" action="repair/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>代碼: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>名字: </td><td><input type="text" name="NAME" value=""></td></tr>

<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>請確認你剛輸入的資料出現了</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>代碼</td>
<td>名字</td>
<td>刪除</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 3 * FROM repair ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"repair\\tree.wet");

      obj.Generate(0,0);
%>


</table>

