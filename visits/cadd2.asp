<script language="javascript" src="visits/add.js"></script>
<!--#include file="add_script.asp"-->
<div id="status"></div>
<form name="addform" action="visits/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>��J��: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>���: </td><td><input type="text" name="DATE" value="<%=date%>"><font color="#AAAAAA">�p�G����S�����n, ��Ʒ|���h</font></td></tr>
<tr><td>�a��: </td><td>
<select name="ZONE">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%obj.Generate(0,0);%>
</select>
�p�G�A�n���a�Ͽ�ܬO�ťժ�,�Х���<a href="l.asp?P=zones">���إ�</a>
</td></tr>
<tr><td>�u�@�O:</td><td>
<select name="JOBTYPE">
<option value="0">0 �˲���</option>
<option value="1">1 ADSL</option>
<option value="2">2 ��u</option>
<option value="3">3 ���</option>
<option value="4">4 ADL��</option>
<option value="5">5 MOD</option>
<option value="6">6 FTTB</option>
<option value="7">7 FTTB+MOD</option>
</select>
</td></tr>
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value="<%=team%>">
<select onchange="addform.TEAM.value=this.value">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%obj.Generate(1,1);%>
</select>
</td></tr>
<tr><td>�p��: </td><td><input onkeyup="catchKey(event,this)" type="text" name="SERIAL" value="" focused></td></tr>
<tr><td>�q��: </td><td><input onkeyup="catchKey(event,this);" type="text" name="PHONE" value=""></td></tr>
<tr><td>�W�U: </td><td>
<select name="AMPM">
<option value='�W��'>�W��</option>
<option value='08:30�e'>08:30�e</option>
<option value='08:30'>08:30</option>
<option value='09:00'>09:00</option>
<option value='10:00'>10:00</option>
<option value='11:00'>11:00</option>
</select>
</td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
<input type="hidden" name="COMPANYID" value="<%=company_id%>">
</form>

<!--
<br>
<img src="images/lastchanges.gif"><br>
<b>�нT�{�A���J����ƥX�{�F</b><br>
<br>
<div id="lastdata">
<!-- include file="getlastdata.asp" 
</div>

-->