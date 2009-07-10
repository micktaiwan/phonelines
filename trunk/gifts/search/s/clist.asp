<form name="searchform" action="l.asp?P=gifts&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>日期: </td><td><input type="text" id="date" value="">  [ <a href="#" onclick="searchform.date.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>地區: </td><td><input type="text" id="zone" value=""></td></tr>
<tr><td>排序: </td><td><select id="sort"><option value="1">班別<option value="2">電話</select></td></tr>
<%if(maintable=="mat") {%>
<tr><td>類別: </td><td><select id="type">
<option value="0">ADSL</option>
<option value="1">FTTB</option>
<option value="2">MOD</option>
</select></td></tr>
<%}else{%>
<input type="hidden" id="type" value=""/>
<%}%>

<tr><td>&nbsp;</td><td><input class="button" type="button" value="查詢" onclick="sendform_list(document.getElementById('date').value,document.getElementById('zone').value,document.getElementById('sort').value,document.getElementById('type').value);"></td></tr>
</table>
</form>

<%if(Request("sp3")=="search_mac") {
mac = Request("mac");
%>
<table border="1" cellspacing="0" cellpadding="0">
<tr><td>日期</td><td>班別</td><td>Phone</td><td>Serial</td><td>Result</td></tr>
<%
	obj.ClearAll();
	obj.NewQuery("SELECT v.DATE, v.TEAM, v.PHONE, v.SERIAL, v.RESULT from MATUSED m left outer join visits v on v.id=m.visitid where m.MAC='"+mac+"'");
    obj.NewTemplate(SitePath+"gifts\\search\\search_by_mac.wet");
    obj.Generate(0,0);
%>
</table>
<%}%>

<div id="status">&nbsp;</div>
<br/>
<div id="sendform_result"></div>
