<form name="addform" action="bom/work/data/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�u�{�s��: </td><td><input type="text" name="IDNUMBER" value=""></td></tr>
<tr><td>�u�{�W��: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>�˲���: </td><td>
<select name="INSTALL">
<option value="0">No</option>
<option value="1">Yes</option>
</select>
</td></tr>
<tr><td>�D����: </td><td><input type="text" name="RESPONSIBLE" value=""></td></tr>
<tr><td>Manager: </td><td>
<select name="MANAGERID">
<option value="-1">======</option>
<%
obj.ClearAll();
obj.NewQuery("SELECT ID,CODE,NAME FROM REPORTERS WHERE BOM=1 ORDER BY CODE");
obj.NewTemplate(SitePath+"reporters\\option.wet");
obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>�~��: </td><td><input type="text" name="YEAR" value=""></td></tr>
<tr><td>����: </td><td><input type="text" name="NBPERIOD" value=""></td></tr>
<tr><td>�u�{����: </td><td><input type="text" name="DATEFROM" value="<%=MyNow(0)%>">�_<br>
<input type="text" name="DATETO" value="<%=MyNow(0)%>">��</td></tr>
<tr><td>Finished: </td><td><input type="text" name="FINISHEDDATE" value=""></td></tr>
<tr><td>�u�{�Ѽ�: </td><td><input type="text" name="DAYS" value=""></td></tr>
<tr><td>����t��: </td><td><input type="text" name="SUPPLIER" value=""></td></tr>
<tr><td>�`�n�I��: </td><td><input type="text" name="NB" value=""></td></tr>
<tr><td>�n�I���: </td><td><input type="text" name="PRICE" value=""></td></tr>
<tr><td>�p���覡: </td><td>
<select name="CALCULTYPE">
<option value="1">�n�I</option>
<option value="2">�M��</option>
</select>
</td></tr>
<tr><td>�|�O: </td><td>
<select name="TAXTYPE">
<option value="1">�t�|</option>
<option value="2">���t�|</option>
</select>
</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
