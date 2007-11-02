<%
   var d = String(Request("D"));
   var m = String(Request("M"));
   var y = String(Request("Y"));
%>
<script language="javascript">

   function submitaddform() {
      String.prototype.Trim  = new Function("return this.replace(/^\\s+|\\s+$/g,'')")
      String.prototype.ReplaceQuote  = new Function("return this.replace(/\"/g,'*')")
      var f = document.addform;
      f.TITLE.value = f.TITLE.value.Trim().ReplaceQuote();
      f.submit();
      return true;
      }

</script>

<table cellpadding="5" cellspacing="1">
<tr><td>
<form name="addform" action="calendar/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>日期: </td><td><%=y%>/<%=m%>/<%=d%></td></tr>
<tr><td>主旨: </td><td><input type="text" name="TITLE" value="" size="50"></td></tr>
<tr><td>&nbsp;</td><td><input type="radio" size="40" name="pub" value="0" checked> 不公開 <input type="radio" size="40" name="pub" value="1"> 公開</td></tr>
<tr><td>內容: </td><td><textarea name="DESCR" cols="50" rows="7"></textarea></td></tr>

<!--
<tr><td valign="top">Alert: </td><td>
<table class="logbox">
<tr><td>Hour:</td><td><select name="ALERTHOUR" style="font-family:Arial;font-size:9pt;">
<option value="0">00</option>
<option value="1">01</option>
<option value="2">02</option>
<option value="3">03</option>
<option value="4">04</option>
<option value="5">05</option>
<option value="6">06</option>
<option value="7">07</option>
<option value="8">08</option>
<option value="9" selected>09</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
</select></td></tr>
<tr><td>Minute:</td><td><select name="ALERTMINUTE" style="font-family:Arial;font-size:9pt;">
<option value="0">00</option>
<option value="5">05</option>
<option value="10">10</option>
<option value="15">15</option>
<option value="20">20</option>
<option value="25">25</option>
<option value="30">30</option>
<option value="35">35</option>
<option value="40">40</option>
<option value="45">45</option>
<option value="50">50</option>
<option value="55">55</option>
</select></td></tr>
<tr><td>Type:</td><td>
<input type="radio" name="ALERTTYPE" value="0">noalert
<input type="radio" name="ALERTTYPE" value="1" checked>ChatAlert
<input type="radio" name="ALERTTYPE" value="2">SMSAlert
<!--<input type="radio" name="ALERTTYPE" value="-1">All-->
<!--</td></tr>
</table>
</td></tr>-->
<tr><td>&nbsp;</td><td><input class="but" type="button" onclick="submitaddform();" value="Add"></td></tr>
</table>
<input type="hidden" name="DAY"       value="<%=d%>">
<input type="hidden" name="MONTH"       value="<%=m%>">
<input type="hidden" name="YEAR"       value="<%=y%>">
<input type="hidden" name="MEMBERID"   value="<%=id%>">
<input type="hidden" name="COMPANYID"  value="<%=company_id%>">
</form>
</td></tr>
</table>
<br>

