<%
   var i = und(GetSession("ITEMSADDI"));
   var c = und(GetSession("ITEMSADDC"));
   var s = und(GetSession("ITEMSADDS"));
   var u = und(GetSession("ITEMSADDU"));
%>
<form name="addform" action="bom/work/items/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>����: </td><td><input type="text" name="ITEM" value="<%=i%>"></td></tr>
<tr><td>�����N��: </td><td><input type="text" name="CODE" value="<%=c%>"></td></tr>
<tr><td>�u�@����: </td><td><input type="text" name="SUBJECT" value="<%=s%>"></td></tr>
<tr><td>�n�I���: </td><td><input type="text" name="PRICE" value=""></td></tr>
<tr><td>���: </td><td><input type="text" name="UNIT" value="<%=u%>"><br>
<tr><td>���n�I: </td><td><input type="text" name="POINTS" value=""><br>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
