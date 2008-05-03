<%
if(admin!="4") {
%>

<img src="images/visits.gif"><br>
<br>
<div style="margin: 0px;border: 1px solid #AAAAA0; background-color : #EEEEE0;padding:10px;">
<form name="addform" action="l.asp?P=visits&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="6">
<tr>
<td class="a90">以聯單號碼查詢：<input type="text" name="SERIAL" value="" class="a90" style="height:14pt">　請務必輸入正確號碼</td>
</tr>

<tr>
<td class="a90">以電話號碼查詢：<input type="text" name="PHONE" value="" class="a90" style="height:14pt">　請務必輸入正確號碼 ( 不須輸入區碼 )<br>
專線號碼要查『乙端』必須在號碼後加『-』。例：225G15427-</td>
</tr>

<tr>
<td class="a90"><input class="button" type="submit" value=" 搜　尋 " class="a90" style="height:14pt"></td>
</tr>
</table>
</form>
<font size="2">
<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT COUNT (ID) AS C FROM VISITS");
   obj.NewTemplate(SitePath+"stats1.wet");
   obj.Generate(0,0);
   obj.NewQuery("SELECT COUNT (ID) AS C FROM REPAIRLOG");
   obj.NewTemplate(SitePath+"stats2.wet");
   obj.Generate(1,1);
%>
</font>
</div>
<br>
<%}%>
<img src="info/lastnews.gif"><br>
<br>
<!-- include file="info/clast.asp"-->
<!--#include file="info/l.asp"-->
