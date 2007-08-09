<form name="addform" action="bom/work/data/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>工程編號: </td><td><input type="text" name="IDNUMBER" value=""></td></tr>
<tr><td>工程名稱: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>裝移機: </td><td>
<select name="INSTALL">
<option value="0">No</option>
<option value="1">Yes</option>
</select>
</td></tr>
<tr><td>主辦單位: </td><td><input type="text" name="RESPONSIBLE" value=""></td></tr>
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
<tr><td>年度: </td><td><input type="text" name="YEAR" value=""></td></tr>
<tr><td>期數: </td><td><input type="text" name="NBPERIOD" value=""></td></tr>
<tr><td>工程期限: </td><td><input type="text" name="DATEFROM" value="<%=MyNow(0)%>">起<br>
<input type="text" name="DATETO" value="<%=MyNow(0)%>">止</td></tr>
<tr><td>Finished: </td><td><input type="text" name="FINISHEDDATE" value=""></td></tr>
<tr><td>工程天數: </td><td><input type="text" name="DAYS" value=""></td></tr>
<tr><td>承攬廠商: </td><td><input type="text" name="SUPPLIER" value=""></td></tr>
<tr><td>總積點數: </td><td><input type="text" name="NB" value=""></td></tr>
<tr><td>積點單價: </td><td><input type="text" name="PRICE" value=""></td></tr>
<tr><td>計價方式: </td><td>
<select name="CALCULTYPE">
<option value="1">積點</option>
<option value="2">專案</option>
</select>
</td></tr>
<tr><td>稅別: </td><td>
<select name="TAXTYPE">
<option value="1">含稅</option>
<option value="2">不含稅</option>
</select>
</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>
