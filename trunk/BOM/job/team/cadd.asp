<form name="addform" action="bom/job/team/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�u�{�s��: </td><td>
<select name="WORKID">
<option value="-1">======</option>
<%
obj.ClearAll();
obj.NewQuery("SELECT ID, IDNUMBER FROM BOMDATA ORDER BY IDNUMBER");
obj.NewTemplate(SitePath+"bom\\work\\data\\option3.wet");
obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>�۽s�y��: </td><td>
<select name="JOBID">
<option value="-1">======</option>
<%
obj.ClearAll();
obj.NewQuery("SELECT ID, CODEB FROM BOMJOB ORDER BY CODEB");
obj.NewTemplate(SitePath+"bom\\job\\data\\option.wet");
obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>�t�d�Z�O: </td><td><input type="text" name="TEAM" value=""></td></tr>
<tr><td>�Z������: </td><td><input type="text" name="DATEA" value="<%=MyNow(0)%>"></td></tr>
<tr><td>�Z��Ϥ��: </td><td><input type="text" name="DATEB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
