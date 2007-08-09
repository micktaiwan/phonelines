<%
//var e = String(Request("E"));
//if(e=="1") Response.Write("<b>OK</b>");
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM problem ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
%>

<form name="addform" action="repairlog/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>申告日期: </td><td><input type="text" name="REPORTDATE" value="<%=MyNow(1)%>"><font color="#AAAAAA">如果沒有打好, 資料會失去</font></td></tr>
<tr><td>通報單位: </td><td><input type="text" name="REPORTER" value=""></td></tr>
<tr><td>障礙電話: </td><td><input type="text" name="PHONE" value=""></td></tr>
<tr><td>聯單號碼: </td><td><input type="text" name="VISITSERIAL" value=""></td></tr>
<tr><td>芯線號碼: </td><td><input type="text" name="PHONEID" value=""></td></tr>
<tr><td>聯絡電纜: </td><td><input type="text" name="BOXID" value=""></td></tr>
<tr><td>障礙原因: </td><td><select name="reason"><%obj.Generate(0,0);%></select></td></tr>
<tr><td>客戶住址: </td><td><input type="text" name="ADDRESS" value=""></td></tr>
<tr><td>備註: </td><td><textarea name="MEMO" cols="60" rows="5"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="OK"></td></tr>
</table>
</form>

<br>
<img src="images/lastchanges.gif"><br>
<b>請確認你剛輸入的資料出現了</b><br>
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

