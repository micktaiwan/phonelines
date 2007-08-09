<table>
<tr><td>
<form name="searchform" action="l.asp?P=gifts&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>日期: </td><td><input type="text" id="date" value="">  [ <a href="#" onclick="searchform.date.value = MyNow(0);">今天</a> ]</td></tr>
<%if(admin=="4") {%>
<input type="hidden" id="team" value="<%=GetSession("PHONECODE")%>">
<%} else {%>
<tr><td>班別: </td><td><input type="text" id="team" value=""></td></tr>
<%}%>
<tr><td>&nbsp;</td><td><input class="button" type="button" value="查詢" onclick="sendform_normal(document.getElementById('date').value,document.getElementById('team').value)"></td></tr>
</table>
</form>
<div id="status">&nbsp;</div>
<%if(admin!="4") {%>
<table border="0" cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#CCDDEE"><td colspan="3">最後的<%=name%></td></tr>
<tr bgcolor="#DDEEFF"><td>日期</td><td>班別</td><td>&nbsp;</td></tr>
<%
   obj.ClearAll();
   obj.NewQuery("SELECT DISTINCT TOP 10 * FROM (SELECT TOP 100 visits.DATE, visits.TEAM FROM "+sectable+"  LEFT JOIN VISITS ON visits.ID="+sectable+".VISITID ORDER BY "+sectable+".ID DESC) T");
   obj.NewTemplate(SitePath+"gifts\\search\\last.wet");
   obj.Generate(0,0);
%>
</table>
<%}%>
</td>
<td>
<div id="sendform_result"></div>
</td>
</tr>
</table>

