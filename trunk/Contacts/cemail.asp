<%
var k = String(Request("K"));
%>
<form action="people/email.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>Subject: </td><td><input type="text" name="A" value=""></td></tr>
<tr><td>Message: </td><td><textarea name="B" rows="10" cols="60"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="but" type="submit" value="Send"></td></tr>
</table>
<input type="hidden" name="K" value="<%=k%>">
</form>
