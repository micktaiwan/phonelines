<%
   var date = GetSession("TEAMJOBDATE");
   if(date=="undefined") date = MyNow(0);
%>


<form name="addform" action="bom/material/team/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value="<%=und(GetSession("TEAMJOBTEAM"))%>"></td></tr>
<tr><td>��Ƥ��: </td><td><input type="text" name="DATE" value="<%=date%>"></td></tr>
<tr><td>���ƥN�X: </td><td><input type="text" name="MATERIALID" value="">
<input class="button" type="button" onclick="openConfirm('bom/material/team/cchoosemat.asp?MAT='+document.addform.MATERIALID.value+'&FORMNAME=addform&FIELDNAME=MATERIALID','500','150');" value="���">
</td></tr>
<tr><td>���ƶq: </td><td><input type="text" name="REALNB" value=""></td></tr>
<tr><td>ú�^�ƶq: </td><td><input type="text" name="PAYNB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
<!--#include file="ctree.asp"-->