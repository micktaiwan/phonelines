<script src="gifts/give/give.js" type="text/javascript"></script>

<form id="addform" name="addform" action="gifts/give/give.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0" width="400">
<tr><td width="80">���: </td><td><input <%if(admin=="4") {%>readonly <%}%> type="text" id="date" name="date" value="<%=MyNow(0)%>"> <%if(admin=="4") {%><b>(input disabled)</b><%}%> [ <a href="#" onclick="addform.date.value = MyNow(0);">����</a> ]</td></tr>
<%if(admin=="4") {%>
<input type="hidden" id="team" name="team" value="<%=GetSession("PHONECODE")%>">
<%} else {%>
<tr><td>�Z�O: </td><td><input type="text" id="team" name="team" value=""></td></tr>
<%}%>
<tr><td>�q�ܸ��X: </td><td><input type="text" id="phone" name="phone" value="" onkeyup="ontextkup(event)">
<input class="button" type="button" onclick="human_check = true; checkrecord();" value="�ˬd">
<span id="checkrecord_result">...</span>
</td></tr>
</table>

<table>
<tr><td>
<table>
<%
	maintable = "gifts";
	name = "�ث~";
   // Prepare the select's options string
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY CODE");
   obj.NewTemplate(SitePath+"gifts\\give\\options.wet");
   options = obj.GenerateString(0,0);
%>
<% for(i=1;i<=5;i++) {%>
<tr><td><%=name%>: </td><td><select id="g<%=i%>"  name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb<%=i%>" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<% } %>
</table><br/>
</td>

<td>
<table>
<script>options = new Array(); opt_i = 0;</script>
<%
	maintable = "mat";
	name = "�]��";
   // Prepare the js array for scripting mac field
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY TYPE, CODE");
   obj.NewTemplate(SitePath+"gifts\\give\\type_array.wet");
   script = obj.GenerateString(0,0);
%>
<script><%=script%></script>
<%	
   // Prepare the select's options string
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY TYPE, CODE");
   obj.NewTemplate(SitePath+"gifts\\give\\options2.wet");
   options = obj.GenerateString(0,0);
%>
<% for(i=6;i<=12;i++) {%>
<tr><td><%=name%>: </td><td><select id="g<%=i%>"  name="mainid" onchange="display_mac(<%=i%>);"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb<%=i%>" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0">
<div id="tdmac<%=i%>" style="display:none">MAC: <input type="text" id="mac<%=i%>" name="mac" onkeyup="check_mac_len(this);"></div></td></tr>
<% } %>

</table><br/>
</td>
</tr>
</table>
</form>
���ˬd�O�_���T�L�~�A�p���T�Ы��yok�z�@�g�T�{�h�L�k���<br/>
<input class="button" type="button" onclick="g('conf').style.display='block';" value="       OK       ">
<div style="display:none;text-align:center;width:230px;" id="conf">�A���z�@�����|�A�нT���ˬd�O�_���T<br>
<input class="button" type="button" onclick="g('conf').style.display='none';sendform();" value="���T">
<input class="button" type="button" onclick="g('conf').style.display='none';g('nb1').focus();" value=" ����">
</div>

<span id="sendform_result"></span>

<div id="status">&nbsp;</div>
<div id="info" style="display:none;" class="infobox"></div>

<script>
resetAll();
</script>
