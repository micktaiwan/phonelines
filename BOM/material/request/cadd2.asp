<form name="addform" action="bom/material/request/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�u�{�s��: </td><td><%=GetSession("matrequestWORKCODE")%></td></tr>
<tr><td>�л���: </td><td><%=GetSession("matrequestDATE")%></td></tr>
<tr><td>�Ƴ�s��: </td><td><%=GetSession("matrequestCODE")%></td></tr>
<tr><td>���ƥN�X: </td><td><input type="text" name="MATERIALID" value="">
<input class="button" type="button" onclick="openConfirm('bom/material/request/cchoosemat.asp?MAT='+document.addform.MATERIALID.value+'&FORMNAME=addform&FIELDNAME=MATERIALID','500','150');" value="���">
</td></tr>
<tr><td>�л�ƶq: </td><td><input type="text" name="REQUESTEDNB" value=""></td></tr>
<tr><td>���ƶq: </td><td><input type="text" name="GIVENNB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
<input type="hidden" name="WORKID" value="<%=GetSession("matrequestWORKCODE")%>">
<input type="hidden" name="DATE" value="<%=GetSession("matrequestDATE")%>">
<input type="hidden" name="CODE" value="<%=GetSession("matrequestCODE")%>">
</table>
</form>
<br>
<!--#include file="ctree.asp"-->