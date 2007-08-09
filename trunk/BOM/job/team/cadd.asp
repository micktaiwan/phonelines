<form name="addform" action="bom/job/team/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>工程編號: </td><td>
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
<tr><td>自編流水: </td><td>
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
<tr><td>負責班別: </td><td><input type="text" name="TEAM" value=""></td></tr>
<tr><td>班收件日期: </td><td><input type="text" name="DATEA" value="<%=MyNow(0)%>"></td></tr>
<tr><td>班交圖日期: </td><td><input type="text" name="DATEB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>
