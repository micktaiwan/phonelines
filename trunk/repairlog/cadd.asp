<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM problem ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
%>

<form name="addform" action="repairlog/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�ӧi���: </td><td><input type="text" name="REPORTDATE" value="<%=MyNow(1)%>"><font color="#AAAAAA">�p�G�S�����n, ��Ʒ|���h</font></td></tr>
<tr><td>�q�����: </td><td><input type="text" name="REPORTER" value=""></td></tr>
<tr><td>��ê�q��: </td><td><input type="text" name="PHONE" value=""></td></tr>
<tr><td>�p�渹�X: </td><td><input type="text" name="VISITSERIAL" value=""></td></tr>
<tr><td>��u���X: </td><td><input type="text" name="PHONEID" value=""></td></tr>
<tr><td>�p���q�l: </td><td><input type="text" name="BOXID" value=""></td></tr>
<tr><td>��ê��]: </td><td><select name="reason"><%obj.Generate(0,0);%></select></td></tr>
<tr><td>�Ȥ��}: </td><td><input type="text" name="ADDRESS" value=""></td></tr>
<tr><td>�Ƶ�: </td><td><textarea name="MEMO" cols="60" rows="5"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="OK"></td></tr>
</table>
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>�нT�{�A���J����ƥX�{�F</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc"-->
<%
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 3 * FROM repairlog ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.NewQuery("SELECT DATE AS ID FROM visits WHERE SERIAL='#'");
      obj.NewTemplate(SitePath+"id.wet");

      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
</table>

