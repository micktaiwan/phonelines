<form name="addform" action="l.asp?bom=1&P=teamjob&SP=add2-1" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�Z�O:</td><td><input type="text" name="TEAM" value="<%=und(GetSession("TEAMJOBADD2TEAM"))%>"></td></tr>
<tr><td>���:</td><td><input type="text" name="DATE" value="<%=und(GetSession("TEAMJOBADD2DATE"))%>"> [<a href="#" onclick="document.addform.DATE.value='<%=MyNow(0)%>'">Today</a>]</td></tr>
<tr><td>�u�{�s��:</td><td><select name="WORKID">
<%
//und(GetSession("TEAMJOBADD2WORKCODE"))
   obj.ClearAll();
   obj.NewQuery("SELECT ID, IDNUMBER FROM BOMDATA ORDER BY IDNUMBER");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\option.wet");
   obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>�u�@�渹:</td><td><input type="text" name="JOBCODE" value="<%=und(GetSession("TEAMJOBADD2JOBCODE"))%>"></td></tr>
<tr><td>�ϸ�:</td><td><input type="text" name="PICTURECODE" value="<%=und(GetSession("TEAMJOBADD2PICTURECODE"))%>"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform2();" value="�~��"></td></tr>
</table>
</form>
