<SCRIPT language="JavaScript">

function verifymeform() {

   var name = document.meform.name;
 	if (name.value == '') {
		name.focus();
		return(false);
		}

   document.meform.submit();

   }

</SCRIPT>

<form name="meform" action="contacts/groups/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>團體: </td><td><input type="text" name="name" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="but" onclick="verifymeform();" type="button" value="增加"></td></tr>
</table>
<input type="hidden" name="memberid" value="<%=id%>">
</form>
