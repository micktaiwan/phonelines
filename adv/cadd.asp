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
         alert('Verify the �q��� field');
         f.FROMDATE.focus();
         return false;
         }
      if(f.TIMELIMIT.value=="1" && !isValidDate(f.TODATE.value)) {
         alert('Verify the ���� field');
         f.TODATE.focus();
         return false;
         }
      if(f.TYPE.value=="0" && f.FILEPATH.value=="") {
         alert('Verify the �Ϥ� field');
         f.FILEPATH.focus();
         return false;
         }
       f.submit();
      return true;
      }
</script>

<form name="addform" action="adv/add.asp" method="post">
<table style="background-color:#AABBCC; border: 1px outset;" border="0" cellspacing="0" cellpadding="3">
<tr><td>����: </td><td><input type="text" name="NAME" value=""></td></tr>
<tr><td>����: </td><td>
<select name="TYPE">
<option value="0">�Ͼ�T</option>
<option value="1">²�T��r</option>
</select>
</td></tr>
<tr bgcolor="#CCBBDD"><td>�Ϥ� (�Ͼ�T): </td><td><input type="text" name="FILEPATH" value=""></td></tr>
<tr bgcolor="#CCBBDD"><td>�s�� (�Ͼ�T): </td><td><input type="text" name="URL" size="40" value=""></td></tr>
<tr bgcolor="#CCBBDD"><td>��m (�Ͼ�T): </td><td><select name="PLACE">
<option value="0">�W</option>
<option value="1">��</option>
</select></td></tr>
<tr bgcolor="#CCDDEE"><td>���� (²�T): </td><td><input type="text" name="TEXT" value="" size="40"></td></tr>
<tr><td>�̤j�n����: </td><td><input type="text" name="MAXVIEW" value="0"></td></tr>
<tr><td>�q���: </td><td><input type="text" name="FROMDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>����: </td><td><select name="TIMELIMIT" onchange="javascript:limitchange();">
<option value="0">�û�</option>
<option value="1">����</option>
</select>
<input type="text" name="TODATE" value="" size="10"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform()" value="�W�[�s�i"></td></tr>
</table>
</form>
