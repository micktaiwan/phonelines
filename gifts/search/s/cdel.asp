<script src="gifts/give/give.js" type="text/javascript"></script>
<form id="addform" name="addform" action="gifts/give/give.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0" width="400">
<tr><td width="80">日期: </td><td><input <%if(admin=="4") {%>readonly <%}%> type="text" id="date" name="date" value="<%=MyNow(0)%>"> <%if(admin=="4") {%><b>(input disabled)</b><%}%> [ <a href="#" onclick="addform.date.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>班別: </td><td><input type="text" id="team" name="team" value=""></td></tr>
<tr><td>電話號碼: </td><td><input type="text" id="phone" name="phone" value="" onkeyup="ontextkup(event)">
<input class="button" type="button" onclick="checkrecord(); senddelform();" value="檢查">
<span id="checkrecord_result"></span>
</td></tr>
</table>
<div id="status">&nbsp;</div>
<div id="delresults"></div>

