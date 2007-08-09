<script>
function change_result(str) {
   alert('OK');
   }
function submit_form() {
   f = document.perso_form
   p = f.p.value
   majax.get("reporters/edit_perso_infos.asp?P="+p,change_result);
   }
</script>

<form name="perso_form" action="">
<table>
<tr><td>±K½X:</td><td><input name="p" value="<%=GetSession("PHONEPASS")%>"></td></tr>
<tr><td>&nbsp;</td><td><input type="button" value="§ó§ï" onclick="submit_form();"></td></tr>
</table>
<form>
