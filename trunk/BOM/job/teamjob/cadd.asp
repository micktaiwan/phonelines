<%
   var wid = und(GetSession("TEAMJOBWORKID"));
   var jid = und(GetSession("TEAMJOBJOBID"));
   var sid = und(GetSession("TEAMJOBSUBJECTID"));
   //var aid = und(GetSession("TEAMJOBASID"));
   //var mid = und(GetSession("TEAMJOBMATID"));
   var team = und(GetSession("TEAMJOBTEAM"));
   var pic        = und(GetSession("TEAMJOBPIC"));
   var moneytype  = und(GetSession("TEAMJOBMONEYTYPE"));
   var mattype    = und(GetSession("TEAMJOBMATTYPE"));
   var type    = und(GetSession("TEAMJOBTYPE"));
%>

<form name="addform" action="bom/job/teamjob/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�Z�O:</td><td><input type="text" name="TEAM" value="<%=team%>"></td></tr>
<tr><td>���:</td><td><input type="text" name="DATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>�u�{�s��:</td><td><input type="text" name="WORKID" value="<%=wid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosework.asp?WORK='+document.addform.WORKID.value+'&FORMNAME=addform&FIELDNAME=WORKID','500','150');" value="���">
<input type="text" name="WORKNAME" value="" disabled>
</td></tr>
<tr><td>�u�@�渹:</td><td><input type="text" name="JOBID" value="<%=jid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosejob.asp?JOB='+document.addform.JOBID.value+'&FORMNAME=addform&FIELDNAME=JOBID','500','150');" value="���">
</td></tr>
<tr><td>�ϸ�:</td><td><input type="text" name="PICTURECODE" value="<%=pic%>"></td></tr>
<tr><td>���O:</td><td><select name="TYPE">
<option value="1" <%if(type=="1") Response.Write("selected");%>>�˾�</option>
<option value="2" <%if(type=="2") Response.Write("selected");%>>����</option>
<option value="3" <%if(type=="3") Response.Write("selected");%>>ADSL</option>
<option value="4" <%if(type=="4") Response.Write("selected");%>>�g��</option>
<option value="5" <%if(type=="5") Response.Write("selected");%>>�u��</option>
<option value="6" <%if(type=="6") Response.Write("selected");%>>�[��</option>
</select></td></tr>
<tr><td>�]���O:</td><td><input type="text" name="MONEYTYPE" value="<%=moneytype%>"></td></tr>
<tr><td>�ƧO:</td><td><input type="text" name="MATTYPE" value="<%=mattype%>"></td></tr>
<tr><td>�u�@���إN��:</td><td><input type="text" name="SUBJECTID" value="<%=sid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchooseitem.asp?ITEM='+document.addform.SUBJECTID.value+'&FORMNAME=addform&FIELDNAME=SUBJECTID','500','150');" value="���">
</td></tr>
<tr><td>�ƶq:</td><td><input type="text" name="QTY" value=""></td></tr>
<tr><td>�[���I�N��:</td><td><input type="text" name="ASID" value="">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchooseascode.asp?ITEM='+document.addform.ASID.value+'&FORMNAME=addform&FIELDNAME=ASID','500','150');" value="���">
</td></tr>
<tr><td>���ƥN��:</td><td><input type="text" name="MATID" value="">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosemat.asp?MAT='+document.addform.MATID.value+'&FORMNAME=addform&FIELDNAME=MATID','500','150');" value="���">
</td></tr>
<tr><td>��μƶq:</td><td><input type="text" name="USEDQTY" value=""></td></tr>
<tr><td>�l��:</td><td><input type="text" name="SURPLUS" value=""></td></tr>
<tr><td>�l��:</td><td><input type="text" name="LOSS" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>

<!--#include file="ctree.asp"-->