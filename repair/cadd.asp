<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"�W�r")) return false;
	form.submit();
	return true;
   
   }

</script>

<form name="addform" action="repair/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�N�X: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>�W�r: </td><td><input type="text" name="NAME" value=""></td></tr>

<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>�нT�{�A���J����ƥX�{�F</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>�N�X</td>
<td>�W�r</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 3 * FROM repair ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"repair\\tree.wet");

      obj.Generate(0,0);
%>


</table>

