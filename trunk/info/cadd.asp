<%
var k = String(Request("K"));
%>
<form action="info/add.asp" method="post">
<table border="0" width='600' cellpadding="3" cellspacing="1">
    <tr>
        <td valign='top'>Title:</td>
        <td><input type="text" size="40" name="title" value=""></td>
    </tr>
    <tr>
        <td valign='top'>Details:</td>
        <td><textarea cols="60" rows=20 name="descr"></textarea></td>
    </tr>
    <tr>
        <td valign="top">&nbsp;</td>
        <td><input type="submit" class="but" value="Add"></td>
    </tr>
  </table>
<input type="hidden" name="MEMBERID"   value="<%=GetSession("PHONEID")%>">
<input type="hidden" name="COMPANYID"   value="<%=company_id%>">
</form>
