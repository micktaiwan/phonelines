<%
//var e = String(Request("E"));
//if(e=="0") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.NAME,"�W�r")) return false;
   if(!checkNull(form.TEAM,"�Z�O")) return false;
   if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}
	form.submit();
	return true;
   
   }

</script>

<form name="addform" action="personnel/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value=""></td></tr>
<tr><td>���O: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>�m�W: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>�j���j: </td><td><textarea name="PHONES"></textarea></td></tr>
<td>�a�q��</td><td><input type="text" name="HPHONE" value=""></td></tr>
<td>¾�~�Ҹ�</td><td><input type="text" name="WORKID" value=""></td></tr>
<td>�X�ͦ~���</td><td><input type="text" name="BIRTHDAY" value=""></td></tr>
<td>�����Ҧr��</td><td><input type="text" name="TAIWANID" value=""></td></tr>
<td>�a�}</td><td><input type="text" name="ADDRESS" value=""></td></tr>
<td>��¾���</td><td><input type="text" name="ARRIVAL" value=""></td></tr>
<td>��¾���</td><td><input type="text" name="DEPARTURE" value=""></td></tr>
<td>�Ƶ�</td><td><textarea name="MEMO"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="COMPANYID" value="<%=company_id%>">
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>�нT�{�A���J����ƥX�{�F</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>�s��</td>
<td>�Z�O</td>
<td>���O</td>
<td>�m�W</td>
<td>��ʹq��</td>
<td>�~�a�q��</td>
<td>¾�~�Ҹ�</td>
<td>�X�ͦ~���</td>
<td>�����Ҧr��</td>
<td>�a�}</td>
<td>��¾���</td>
<td>��¾���</td>
<td>�Ƶ�</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 3 * FROM personnel WHERE COMPANYID='"+company_id+"' ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");
      obj.Generate(0,0);
%>


</table>

