<script language="javascript" src="visits/add.js"></script>
<!--#include file="add_script.asp"-->
<div id="status"></div>
<form name="addform" action="visits/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>輸入員: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>日期: </td><td><input type="text" name="DATE" value="<%=date%>"><font color="#AAAAAA">如果日期沒有打好, 資料會失去</font></td></tr>
<tr><td>地區: </td><td>
<select name="ZONE">
<option value="">>----- 選擇 -----<</option>
<option value=""> </option>
<%obj.Generate(0,0);%>
</select>
如果你要的地區選擇是空白的,請先按<a href="l.asp?P=zones">此建立</a>
</td></tr>
<tr><td>工作別:</td><td>
<select name="JOBTYPE">
<option value="0">0 裝移機</option>
<option value="1">1 ADSL</option>
<option value="2">2 拆線</option>
<option value="3">3 更模</option>
<option value="4">4 ADL拆</option>
<option value="5">5 MOD</option>
<option value="6">6 FTTB</option>
<option value="7">7 FTTB+MOD</option>
</select>
</td></tr>
<tr><td>班別: </td><td><input type="text" name="TEAM" value="<%=team%>">
<select onchange="addform.TEAM.value=this.value">
<option value="">>----- 選擇 -----<</option>
<option value=""> </option>
<%obj.Generate(1,1);%>
</select>
</td></tr>
<tr><td>聯單: </td><td><input onkeyup="catchKey(event,this)" type="text" name="SERIAL" value="" focused></td></tr>
<tr><td>電話: </td><td><input onkeyup="catchKey(event,this);" type="text" name="PHONE" value=""></td></tr>
<tr><td>上下: </td><td>
<select name="AMPM">
<option value='上午'>上午</option>
<option value='08:30前'>08:30前</option>
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
<b>請確認你剛輸入的資料出現了</b><br>
<br>
<div id="lastdata">
<!-- include file="getlastdata.asp" 
</div>

-->