<form name="addform" action="bom/material/request/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�u�{�s��: </td><td><input type="text" name="WORKID" value="">
<input class="button" type="button" onclick="openConfirm('bom/material/request/cchoosework.asp?WORK='+document.addform.WORKID.value+'&FORMNAME=addform&FIELDNAME=WORKID','400','150');" value="���">
</td></tr>
<tr><td>�л���: </td><td><input type="text" name="DATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>�Ƴ�s��: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>���ƥN�X: </td><td><input type="text" name="MATERIALID" value="">
<input class="button" type="button" onclick="openConfirm('bom/material/request/cchoosemat.asp?MAT='+document.addform.MATERIALID.value+'&FORMNAME=addform&FIELDNAME=MATERIALID','500','150');" value="���">
</td></tr>
<tr><td>�л�ƶq: </td><td><input type="text" name="REQUESTEDNB" value=""></td></tr>
<tr><td>���ƶq: </td><td><input type="text" name="GIVENNB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
