<script>
function deletecode_d(s) {
   if(s.charAt(0)=="0") {
      setstatus("<b>Deleted</b>");
      g("img"+s.substring(1,s.length)).style.display = "none";
      }
   else if(s.charAt(0)=="1") setstatus("<strong>You are not an administrator</strong>");
   else setstatus("<strong>Unknown response:</strong><br>"+s);
   }

function deletecode(id) {
   setstatus("Executing...");
   majax.get("gifts/codes/delete.asp?K="+id,deletecode_d);
   }
</script>
<div id="status">&nbsp;</div>


<% if(admin=="5") { %>
<br/>
<b>��J�N�X</b><br/>
<br/>
<script language="javascript">
function verify () {
   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"�W�r")) return false;
	form.submit();
	return true;
   }
</script>
<form name="addform" action="gifts/codes/add.asp?SP=<%=sp%>" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�N�X: </td><td><input type="text" name="CODE" value=""></td></tr>
<tr><td>�W�r: </td><td><input type="text" name="NAME" value=""></td></tr>
<%if(maintable=="mat") {%>
<tr><td>type: </td><td>
<select name="type">
<option value="0">ADSL</option>
<option value="1">FTTB</option>
<option value="2">MOD</option>
<option value="3">A</option>
<option value="4">B</option>
<option value="10">��ADSL</option>
<option value="11">��FTTB</option>
<option value="12">��MOD</option>
<option value="13">��A</option>
<option value="14">��B</option>
</select>
</td></tr>
<%}%>

<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form><br/>
<% } %>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�N�X</td>
<td>�W��</td>
<td>TYPE</td>
<td>�R��</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM "+maintable+" ORDER BY CODE");
      if(maintable!="mat") obj.NewTemplate(SitePath+"gifts\\codes\\tree.wet");
      else obj.NewTemplate(SitePath+"gifts\\codes\\tree2.wet");
      obj.Generate(0,0);
%>
</table><br/>

