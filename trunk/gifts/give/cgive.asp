
<script src="gifts/give/give.js" type="text/javascript"></script>
<form id="addform" name="addform" action="gifts/give/give.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0" width="400">
<tr><td width="80">���: </td><td><input <%if(admin=="4") {%>readonly <%}%> type="text" id="date" name="date" value="<%=MyNow(0)%>"> <%if(admin=="4") {%><b>(input disabled)</b><%}%> [ <a href="#" onclick="addform.date.value = MyNow(0);">����</a> ]</td></tr>
<%if(admin=="4") {%>
<input type="hidden" id="team" name="team" value="<%=GetSession("PHONECODE")%>">
<%} else {%>
<tr><td>�Z�O: </td><td><input type="text" id="team" name="team" value=""></td></tr>
<%}%>
<tr><td>�q�ܸ��X: </td><td><input type="text" id="phone" name="phone" value="" onkeyup="ontextkup(event)"><input class="button" type="button" onclick="checkrecord();" value="�ˬd">
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
<tr><td><%=name%>: </td><td><select id="g1"  name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb1" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g2" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb2" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g3" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb3" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g4" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb4" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g5" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb5" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
</table><br/>
</td>

<td>
<table>
<%
	maintable = "mat";
	name = "�]��";
   // Prepare the select's options string
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY TYPE, CODE");
   obj.NewTemplate(SitePath+"gifts\\give\\options2.wet");
   options = obj.GenerateString(0,0);
%>
<tr><td><%=name%>: </td><td><select id="g6"  name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb6" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g7" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb7" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g8" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb8" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g9" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb9" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
<tr><td><%=name%>: </td><td><select id="g10" name="mainid"><%=options%></select></td>
<td>�ƶq: </td><td><input  id="nb10" onkeyup="checknb(this);" size="3" type="text" name="nb" value="0"></td></tr>
</table><br/>
</td>

<td>
<table>
<%
	maintable = "mat";
	name = "�]��";
   // Prepare the select's options string
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY TYPE, CODE");
   obj.NewTemplate(SitePath+"gifts\\give\\options2.wet");
   options = obj.GenerateString(0,0);
%>
<tr><td>MAC: <input type="text" id="mac6" name="mac"></td></tr>
<tr><td>MAC: <input type="text" id="mac7" name="mac"></td></tr>
<tr><td>MAC: <input type="text" id="mac8" name="mac"></td></tr>
<tr><td>MAC: <input type="text" id="mac9" name="mac"></td></tr>
<tr><td>MAC: <input type="text" id="mac10" name="mac"></td></tr>
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
checkAll();
for(i=0;i<5;++i) {
   var s = document.getElementById("g"+(i+1));
   if(s.length < (i+1)) s.length  = 0;
   else s.options[i].selected = true;
   }
for(i=0;i<5;++i) {
   var s = document.getElementById("g"+(i+6));
   if(s.length < (i+1)) s.length  = 0;
   else s.options[i].selected = true;
   }
</script>
