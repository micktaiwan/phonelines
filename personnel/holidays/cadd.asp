<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   //if(!checkNull(form.TEAMID,"�Z�O")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}
	form.submit();
	return true;

   }

</script>

<form name="addform" action="personnel/holidays/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�Z�O: </td><td><select name="TEAMID">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT ID,TEAM,NAME FROM PERSONNEL ORDER BY TEAM");
      obj.NewTemplate(SitePath+"personnel\\option.wet");
      obj.Generate(0,0);
%>
</select>
</td></tr>
<td>����</td><td><select name="type">
<option value="0">�f��</option>
<option value="1">�ư�</option>
<option value="2">����</option>
<option value="3">�ల</option>
<option value="4">�B��</option>
<option value="5">����</option>
</select></td></tr>
<td>�ƥ�</td><td><textarea name="REASON" rows="2" cols="40"></textarea></td></tr>
<td>¾�ȥN�z�H</td><td><input type="text" name="REPLACANT" value=""></td></tr>
<td>�����</td><td><input type="text" name="FROMDATE" value="<%=MyNow(0)%>"></td></tr>
<td>����</td><td><input type="text" name="TODATE" value="<%=MyNow(0)%>"></td></tr>
<td>�Ƶ�</td><td><textarea name="MEMO"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="ENTERID" value="<%=id%>">
</form>
