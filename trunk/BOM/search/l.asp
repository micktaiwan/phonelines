�d��<br>
<br>
<table cellspacing="1" cellpadding="10" bgcolor="#AAAAA0">
<tr  bgcolor="#EEEEE0">
<td>
<form action="" method="post">
<input type="text" name="WORKCODE" value="" size="8"><input class="button" type="submit" value="�H�u�{�s��">
</form>
</td>
<td>
<form action="" method="post">
<input type="text" name="JOBCODE" value="" size="8">&nbsp;<input class="button" type="submit" value="�H�u�@��s��">
</form>
</td>
<td>
<form action="" method="post">
<input type="text" name="OURCODE" value="" size="8">&nbsp;<input class="button" type="submit" value="�H�۽s�y��">
</form>
</td>
<td>
<form action="" method="post"><input type="text" name="TEAM" value="" size="8">&nbsp;<input class="button" type="submit" value="�H�����u�Z�O"></form>
</td>
</tr>


<tr bgcolor="#EEEEE0">
<td>
<form action="" method="post">
�q<input type="text" name="DATEA" value="<%=MyNow(0)%>" size="8"><br>
��<input type="text" name="DATEB" value="<%=MyNow(0)%>" size="8"><br>
<input class="button" type="submit" value="�H������">
</form>
</td>
<td>
<form action="" method="post"><input class="button" style="width:100%" type="submit" name="LATE" value="�H�O���ץ�"></form>
</td>
<td>
<form action="" method="post"><input type="text" name="MONEYREQ" value="" size="8">&nbsp;<input class="button" type="submit" value="�H�дڴڦ�"></form>
</td>
<td>
<form action="" method="post">
<table>
<tr>
<td>�Z�O:</td><td><input class="text" name="COMBOTEAM" value="" size="5"></td></tr>
<td>�u�{�s��:</td><td><input class="text" name="COMBOCODE" value="" size="5"></td></tr>
<td></td><td><select disabled>
<option value="">����</option>
<option value="">�����u</option>
<option value="">�w���u</option>
<option value="">�O�ɮץ�</option>
</select></td></tr>
<td></td><td><input class="button" type="submit" value="�d��"></td></tr>
</table>
</form>
</td>
</tr>
</table>
<br>
<br>
<%
   switch(sp.toLowerCase()) {
      case "undefined" :
      case "welcome" :
        %><!--#include file="ctree.asp" --><%
      	break;
      default:
%>
<br>
This page can not be found<br>
<br>
<% 	} // switch %>
