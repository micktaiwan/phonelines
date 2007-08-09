<%
   var i = und(GetSession("ITEMSADDI"));
   var c = und(GetSession("ITEMSADDC"));
   var s = und(GetSession("ITEMSADDS"));
   var u = und(GetSession("ITEMSADDU"));
%>
<form name="addform" action="bom/work/items/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>項次: </td><td><input type="text" name="ITEM" value="<%=i%>"></td></tr>
<tr><td>項次代號: </td><td><input type="text" name="CODE" value="<%=c%>"></td></tr>
<tr><td>工作項目: </td><td><input type="text" name="SUBJECT" value="<%=s%>"></td></tr>
<tr><td>積點單價: </td><td><input type="text" name="PRICE" value=""></td></tr>
<tr><td>單位: </td><td><input type="text" name="UNIT" value="<%=u%>"><br>
<tr><td>單位積點: </td><td><input type="text" name="POINTS" value=""><br>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>
