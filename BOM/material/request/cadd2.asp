<form name="addform" action="bom/material/request/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>工程編號: </td><td><%=GetSession("matrequestWORKCODE")%></td></tr>
<tr><td>請領日期: </td><td><%=GetSession("matrequestDATE")%></td></tr>
<tr><td>料單編號: </td><td><%=GetSession("matrequestCODE")%></td></tr>
<tr><td>局料代碼: </td><td><input type="text" name="MATERIALID" value="">
<input class="button" type="button" onclick="openConfirm('bom/material/request/cchoosemat.asp?MAT='+document.addform.MATERIALID.value+'&FORMNAME=addform&FIELDNAME=MATERIALID','500','150');" value="選擇">
</td></tr>
<tr><td>請領數量: </td><td><input type="text" name="REQUESTEDNB" value=""></td></tr>
<tr><td>實領數量: </td><td><input type="text" name="GIVENNB" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
<input type="hidden" name="WORKID" value="<%=GetSession("matrequestWORKCODE")%>">
<input type="hidden" name="DATE" value="<%=GetSession("matrequestDATE")%>">
<input type="hidden" name="CODE" value="<%=GetSession("matrequestCODE")%>">
</table>
</form>
<br>
<!--#include file="ctree.asp"-->