<SCRIPT language="JavaScript">

function verifymeform() {

   var sms = document.meform.smsphone;
 	if (sms.value != '' && sms.value.length != 10) {
		alert("SMS phone number must 10 chars long.\nEnter no spaces or other signs but digits.\nOnly Taiwanese cell phone numbers are allowed.");
		sms.focus();
		return(false);
		}

   document.meform.submit();

   }

</SCRIPT>

<form name="meform" action="contacts/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�W�r: </td><td><input type="text" name="name" value=""><strong>*</strong></td></tr>
<tr><td>���q: </td><td><input type="text" name="company" value=""></td></tr>
<tr><td>Email: </td><td><input type="text" name="email" value=""></td></tr>
<tr><td>Web: </td><td><input type="text" name="web" value=""></td></tr>
<tr><td>��}: </td><td><textarea name="address" rows="3" cols="50"></textarea></td></tr>
<tr><td>�q��: </td><td><textarea name="phone" rows="3" cols="50"></textarea></td></tr>
<tr><td>SMS Phone: </td><td><input type="text" name="smsphone" value="" size="50"></td></tr>
<tr><td>Notes: </td><td><textarea name="notes" rows="10" cols="50"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input type="radio" name="pub" value="0" checked> Private
<input type="radio" name="pub" value="1"> Public</td></tr>
<tr><td>����: </td><td><select name="GROUPID">
<option value="0">None</option>


<%
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM contactgroups WHERE MEMBERID='"+id+"'");
   obj.NewTemplate(SitePath+"contacts\\groups\\option.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>


</select></td></tr>
<tr><td>&nbsp;</td><td>
<br>
<input class="but" onclick="verifymeform();" type="button" value="�W�["></td></tr>
</table>
<input type="hidden" name="memberid" value="<%=id%>">
</form>
