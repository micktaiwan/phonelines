<%
var e = String(Request("E"));
if(e=="1") Response.Write("<b>OK</b>");
if(e=="2") Response.Write("<strong>Problem</strong>");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"名字")) return false;
   var sms = document.addform.smsphone;
 	if (sms.value != '' && sms.value.length != 10) {
		alert("SMS phone number must 10 chars long.\nEnter no spaces or other signs but digits.\nOnly Taiwanese cell phone numbers are allowed.");
		sms.focus();
		return(false);
		}

	form.submit();
	return true;

   }

</script>

<form name="addform" action="reporters/add.asp" method="post">
<table border="0" cellspacing="5" cellpadding="2">
<tr><td>代碼: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>名字: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>密碼: </td><td><input type="text" name="PASS" value=""></td></tr>
<tr><td>權利: </td><td style="background-color:#EEEEE0;border:solid 1px #AAAAA0;">
<input type="radio" name="admin" value="4"> 工班<br>
<input type="radio" name="admin" value="0" checked> 凡人<br>
<input type="radio" name="admin" value="3"> 超人<br>
<input type="radio" name="admin" value="1"> 管理人<br>
<input type="radio" name="admin" value="2"> 國王<br>
<input type="radio" name="admin" value="5"> 管理大師<br>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td style="background-color:#EEEEE0;border:solid 1px #AAAAA0;">
工程管理:<input type="radio" name="bom" value="0" checked> No
<input type="radio" name="bom" value="1"> Yes<br>
</td>
</tr>
<tr><td>SMS Phone: </td><td><input type="text" name="smsphone" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="companyid" value="<%=company_id%>">
<input type="hidden" name="groupid" value="0">
<input type="hidden" name="totalsms" value="0">
<input type="hidden" name="smshnid" value="0">
<input type="hidden" name="smsleft" value="0">
</form>
