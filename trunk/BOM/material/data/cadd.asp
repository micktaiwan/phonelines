<form name="addform" action="bom/material/data/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>���ƥN�X: </td><td><input type="text" name="CODE" value="<%=und(GetSession("BOMMATCODE"))%>"></td></tr>
<tr><td>���ƥN�X: </td><td><input type="text" name="SUPPLIER" value="<%=und(GetSession("BOMMATSUPPLIER"))%>"></td></tr>
<tr><td>�˽X: </td><td><input type="text" name="CHECKCODE" value=""></td></tr>
<tr><td>���ƦW��: </td><td><input type="text" name="NAME" value="<%=und(GetSession("BOMMATNAME"))%>"></td></tr>
<tr><td>���: </td><td><input type="text" name="UNIT" value="<%=und(GetSession("BOMMATUNIT"))%>"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
