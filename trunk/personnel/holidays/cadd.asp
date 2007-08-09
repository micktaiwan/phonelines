<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   //if(!checkNull(form.TEAMID,"班別")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('班別錯誤');return false;}
	form.submit();
	return true;

   }

</script>

<form name="addform" action="personnel/holidays/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>班別: </td><td><select name="TEAMID">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT ID,TEAM,NAME FROM PERSONNEL ORDER BY TEAM");
      obj.NewTemplate(SitePath+"personnel\\option.wet");
      obj.Generate(0,0);
%>
</select>
</td></tr>
<td>類型</td><td><select name="type">
<option value="0">病假</option>
<option value="1">事假</option>
<option value="2">公假</option>
<option value="3">喪假</option>
<option value="4">婚假</option>
<option value="5">產假</option>
</select></td></tr>
<td>事由</td><td><textarea name="REASON" rows="2" cols="40"></textarea></td></tr>
<td>職務代理人</td><td><input type="text" name="REPLACANT" value=""></td></tr>
<td>離日期</td><td><input type="text" name="FROMDATE" value="<%=MyNow(0)%>"></td></tr>
<td>到日期</td><td><input type="text" name="TODATE" value="<%=MyNow(0)%>"></td></tr>
<td>備註</td><td><textarea name="MEMO"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="ENTERID" value="<%=id%>">
</form>
