<form name="addform" action="bom/job/admin/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>工程編號: </td><td><input type="text" name="JOBID" value=""></td></tr>
<tr><td>報局派工日期: </td><td><input type="text" name="DATEA" value="<%=MyNow(0)%>"></td></tr>
<tr><td>報局竣工日期: </td><td><input type="text" name="DATEB" value="<%=MyNow(0)%>"></td></tr>
<tr><td>送圖請款日期: </td><td><input type="text" name="DATEC" value="<%=MyNow(0)%>"></td></tr>
<tr><td>請款款次: </td><td><input type="text" name="MONEYREQ" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>
