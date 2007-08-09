<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   //if(!checkNull(form.TEAMID,"痁")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('痁岿粇');return false;}
	form.submit();
	return true;

   }

</script>

<form name="addform" action="personnel/missions/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>﹎: </td><td><select name="TEAMID">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT ID,TEAM,NAME FROM PERSONNEL ORDER BY TEAM");
      obj.NewTemplate(SitePath+"personnel\\option.wet");
      obj.Generate(0,0);
%>
</select>
</td></tr>
<!--
<td>摸</td><td><select name="type">
<option value="0">痜安</option>
<option value="1">ㄆ安</option>
<option value="2">そ安</option>
<option value="3">赤安</option>
<option value="4">盉安</option>
<option value="5">玻安</option>
</select></td></tr>
-->
<td>ㄆパ</td><td><textarea name="REASON" rows="2" cols="40"></textarea></td></tr>
<td>癬﹍翴</td><td><input type="text" name="PLACE" value=""></td></tr>
<td>ら癬</td><td><input type="text" name="FROMDATE" value="<%=MyNow(0)%> 12:00:00"></td></tr>
<td>らゎ</td><td><input type="text" name="TODATE" value="<%=MyNow(0)%> 12:00:00"></td></tr>
<td>称爹</td><td><textarea name="MEMO"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="ENTERID" value="<%=id%>">
</form>
