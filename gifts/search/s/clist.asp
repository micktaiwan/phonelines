<form name="searchform" action="l.asp?P=gifts&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>���: </td><td><input type="text" id="date" value="">  [ <a href="#" onclick="searchform.date.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>�a��: </td><td><input type="text" id="zone" value=""></td></tr>
<tr><td>�Ƨ�: </td><td><select id="sort"><option value="1">�Z�O<option value="2">�q��</select></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" value="�d��" onclick="sendform_list(document.getElementById('date').value,document.getElementById('zone').value,document.getElementById('sort').value);"></td></tr>
</table>
</form>
<div id="status">&nbsp;</div>

<div id="sendform_result"></div>
