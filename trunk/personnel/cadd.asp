<%
//var e = String(Request("E"));
//if(e=="0") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.NAME,"名字")) return false;
   if(!checkNull(form.TEAM,"班別")) return false;
   if(String(parseInt(form.TEAM.value))=="NaN") {alert('班別錯誤');return false;}
	form.submit();
	return true;
   
   }

</script>

<form name="addform" action="personnel/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>班別: </td><td><input type="text" name="TEAM" value=""></td></tr>
<tr><td>附記: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>姓名: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>大哥大: </td><td><textarea name="PHONES"></textarea></td></tr>
<td>家電話</td><td><input type="text" name="HPHONE" value=""></td></tr>
<td>職業證號</td><td><input type="text" name="WORKID" value=""></td></tr>
<td>出生年月日</td><td><input type="text" name="BIRTHDAY" value=""></td></tr>
<td>身分證字號</td><td><input type="text" name="TAIWANID" value=""></td></tr>
<td>地址</td><td><input type="text" name="ADDRESS" value=""></td></tr>
<td>到職日期</td><td><input type="text" name="ARRIVAL" value=""></td></tr>
<td>離職日期</td><td><input type="text" name="DEPARTURE" value=""></td></tr>
<td>備註</td><td><textarea name="MEMO"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="COMPANYID" value="<%=company_id%>">
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>請確認你剛輸入的資料出現了</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>編輯</td>
<td>班別</td>
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
      obj.NewQuery("SELECT TOP 3 * FROM personnel WHERE COMPANYID='"+company_id+"' ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");
      obj.Generate(0,0);
%>


</table>

