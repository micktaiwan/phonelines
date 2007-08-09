<script language="javascript" src="verifdate.js"></script>

<script language="javascript">
   function limitchange() {
      var f = document.addform;
      if(f.TIMELIMIT.value=="0") f.TODATE.value='';
      else f.TODATE.value='<%=MyNow()%>';
      }

   function submitaddform() {
      var f = document.addform;
      if(f.NAME.value=="") {
         alert('Verify the name field');
         f.NAME.focus();
         return false;
         }
      if(f.TYPE.value=="1" && (f.TEXT.value == "" || f.TEXT.value.length > 38)) {
         alert('Verify the text field');
         f.TEXT.focus();
         return false;
         }
      if(!isValidDate(f.FROMDATE.value)) {
         alert('Verify the 從日期 field');
         f.FROMDATE.focus();
         return false;
         }
      if(f.TIMELIMIT.value=="1" && !isValidDate(f.TODATE.value)) {
         alert('Verify the 到日期 field');
         f.TODATE.focus();
         return false;
         }
      if(f.TYPE.value=="0" && f.FILEPATH.value=="") {
         alert('Verify the 圖片 field');
         f.FILEPATH.focus();
         return false;
         }
       f.submit();
      return true;
      }
</script>

<form name="addform" action="adv/add.asp" method="post">
<table style="background-color:#AABBCC; border: 1px outset;" border="0" cellspacing="0" cellpadding="3">
<tr><td>提示: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>類型: </td><td>
<select name="TYPE">
<option value="0">圖橫幅</option>
<option value="1">簡訊文字</option>
</select>
</td></tr>
<tr bgcolor="#CCBBDD"><td>圖片 (圖橫幅): </td><td><input type="text" name="FILEPATH" value=""></td></tr>
<tr bgcolor="#CCBBDD"><td>連接 (圖橫幅): </td><td><input type="text" name="URL" size="40" value=""></td></tr>
<tr bgcolor="#CCBBDD"><td>位置 (圖橫幅): </td><td><select name="PLACE">
<option value="0">上</option>
<option value="1">左</option>
</select></td></tr>
<tr bgcolor="#CCDDEE"><td>消息 (簡訊): </td><td><input type="text" name="TEXT" value="" size="40"></td></tr>
<tr><td>最大曝光數: </td><td><input type="text" name="MAXVIEW" value="0"></td></tr>
<tr><td>從日期: </td><td><input type="text" name="FROMDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>到日期: </td><td><select name="TIMELIMIT" onchange="javascript:limitchange();">
<option value="0">永遠</option>
<option value="1">有限</option>
</select>
<input type="text" name="TODATE" value="" size="10"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform()" value="增加廣告"></td></tr>
</table>
</form>
