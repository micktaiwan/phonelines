





Pas utilisee !
Voir ctree




<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"¦W¦r")) return false;
	form.submit();
	return true;

   }

</script>

<form name="addform" action="gifts/codes/add.asp?SP=<%=sp%>" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>¥N½X: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>¦W¦r: </td><td><input type="text" name="NAME" value=""></td></tr>

<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>

<br>
