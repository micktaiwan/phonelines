<form name="searchform" action="l.asp?P=gifts&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>���: </td><td><input type="text" id="date1" value="" size="6">  [ <a href="#" onclick="searchform.date1.value = MyNow(0);">����</a> ]
�� <input type="text" id="date2" value="" size="6">    [ <a href="#" onclick="searchform.date2.value = MyNow(0);">����</a> ]
<tr><td>�a��: </td><td><input type="text" id="zone" value="" size="5"></td></tr>
<tr><td>�Z�O: </td><td><input type="text" id="team" value="" size="5"> (can be empty)</td></tr>
<%if(maintable=="mat") {%>
<tr><td>���O: </td><td><select id="type">
<option value="0">ADSL</option>
<option value="1">FTTB</option>
<option value="2">MOD</option>
</select></td></tr>
<%}else{%>
<input type="hidden" id="type" value=""/>
<%}%>

<tr><td>&nbsp;</td><td><input class="button" type="button" value="�d��" onclick="sendform_total(document.getElementById('date1').value,document.getElementById('date2').value,document.getElementById('zone').value,document.getElementById('team').value,document.getElementById('type').value)"></td></tr>
</table>
</form>
<div id="status">&nbsp;</div>

<div id="sendform_result"></div>

