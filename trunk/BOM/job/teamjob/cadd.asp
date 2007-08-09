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
<tr><td>班別:</td><td><input type="text" name="TEAM" value="<%=team%>"></td></tr>
<tr><td>日期:</td><td><input type="text" name="DATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>工程編號:</td><td><input type="text" name="WORKID" value="<%=wid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosework.asp?WORK='+document.addform.WORKID.value+'&FORMNAME=addform&FIELDNAME=WORKID','500','150');" value="選擇">
<input type="text" name="WORKNAME" value="" disabled>
</td></tr>
<tr><td>工作單號:</td><td><input type="text" name="JOBID" value="<%=jid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosejob.asp?JOB='+document.addform.JOBID.value+'&FORMNAME=addform&FIELDNAME=JOBID','500','150');" value="選擇">
</td></tr>
<tr><td>圖號:</td><td><input type="text" name="PICTURECODE" value="<%=pic%>"></td></tr>
<tr><td>類別:</td><td><select name="TYPE">
<option value="1" <%if(type=="1") Response.Write("selected");%>>裝機</option>
<option value="2" <%if(type=="2") Response.Write("selected");%>>移機</option>
<option value="3" <%if(type=="3") Response.Write("selected");%>>ADSL</option>
<option value="4" <%if(type=="4") Response.Write("selected");%>>土木</option>
<option value="5" <%if(type=="5") Response.Write("selected");%>>線路</option>
<option value="6" <%if(type=="6") Response.Write("selected");%>>架空</option>
</select></td></tr>
<tr><td>財產別:</td><td><input type="text" name="MONEYTYPE" value="<%=moneytype%>"></td></tr>
<tr><td>料別:</td><td><input type="text" name="MATTYPE" value="<%=mattype%>"></td></tr>
<tr><td>工作項目代號:</td><td><input type="text" name="SUBJECTID" value="<%=sid%>">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchooseitem.asp?ITEM='+document.addform.SUBJECTID.value+'&FORMNAME=addform&FIELDNAME=SUBJECTID','500','150');" value="選擇">
</td></tr>
<tr><td>數量:</td><td><input type="text" name="QTY" value=""></td></tr>
<tr><td>加減點代號:</td><td><input type="text" name="ASID" value="">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchooseascode.asp?ITEM='+document.addform.ASID.value+'&FORMNAME=addform&FIELDNAME=ASID','500','150');" value="選擇">
</td></tr>
<tr><td>材料代號:</td><td><input type="text" name="MATID" value="">
<input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosemat.asp?MAT='+document.addform.MATID.value+'&FORMNAME=addform&FIELDNAME=MATID','500','150');" value="選擇">
</td></tr>
<tr><td>實用數量:</td><td><input type="text" name="USEDQTY" value=""></td></tr>
<tr><td>餘長:</td><td><input type="text" name="SURPLUS" value=""></td></tr>
<tr><td>損耗:</td><td><input type="text" name="LOSS" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>

<!--#include file="ctree.asp"-->