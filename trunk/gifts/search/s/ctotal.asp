<form name="searchform" action="l.asp?P=gifts&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>日期: </td><td><input type="text" id="date1" value="" size="6">  [ <a href="#" onclick="searchform.date1.value = MyNow(0);">今天</a> ]
至 <input type="text" id="date2" value="" size="6">    [ <a href="#" onclick="searchform.date2.value = MyNow(0);">今天</a> ]
<tr><td>地區: </td><td><input type="text" id="zone" value="" size="5"></td></tr>
<tr><td>班別: </td><td><input type="text" id="team" value="" size="5"> (can be empty)</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" value="查詢" onclick="sendform_total(document.getElementById('date1').value,document.getElementById('date2').value,document.getElementById('zone').value,document.getElementById('team').value)"></td></tr>
</table>
</form>
<div id="status">&nbsp;</div>

<div id="sendform_result"></div>

