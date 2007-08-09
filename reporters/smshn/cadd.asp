<script language="javascript">
   function verifform() {
      var f = document.smsform;
      if(f.HN.value.length!=8) {
         alert("bad HN number");
         f.HN.focus();
         return;
         }
      if(f.PASS.value.length!=8) {
         alert("bad pass");
         f.PASS.focus();
         return;
         }
      f.submit();
      }

</script>

<form name="smsform" action="reporters/smshn/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>Name: </td><td><input type="text" name="Name" value=""></td></tr>
<tr><td>HN: </td><td><input type="text" name="HN" value=""></td></tr>
<tr><td>Pass: </td><td><input type="text" name="PASS" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="javascript:verifform();" value="Add"></td></tr>
</table>
<input type="hidden" name="companyid" value="<%=company_id%>">
</form>
