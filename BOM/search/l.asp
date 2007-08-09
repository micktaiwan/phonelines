查詢<br>
<br>
<table cellspacing="1" cellpadding="10" bgcolor="#AAAAA0">
<tr  bgcolor="#EEEEE0">
<td>
<form action="" method="post">
<input type="text" name="WORKCODE" value="" size="8"><input class="button" type="submit" value="以工程編號">
</form>
</td>
<td>
<form action="" method="post">
<input type="text" name="JOBCODE" value="" size="8">&nbsp;<input class="button" type="submit" value="以工作單編號">
</form>
</td>
<td>
<form action="" method="post">
<input type="text" name="OURCODE" value="" size="8">&nbsp;<input class="button" type="submit" value="以自編流水">
</form>
</td>
<td>
<form action="" method="post"><input type="text" name="TEAM" value="" size="8">&nbsp;<input class="button" type="submit" value="以未完工班別"></form>
</td>
</tr>


<tr bgcolor="#EEEEE0">
<td>
<form action="" method="post">
從<input type="text" name="DATEA" value="<%=MyNow(0)%>" size="8"><br>
至<input type="text" name="DATEB" value="<%=MyNow(0)%>" size="8"><br>
<input class="button" type="submit" value="以收件日期">
</form>
</td>
<td>
<form action="" method="post"><input class="button" style="width:100%" type="submit" name="LATE" value="以逾期案件"></form>
</td>
<td>
<form action="" method="post"><input type="text" name="MONEYREQ" value="" size="8">&nbsp;<input class="button" type="submit" value="以請款款次"></form>
</td>
<td>
<form action="" method="post">
<table>
<tr>
<td>班別:</td><td><input class="text" name="COMBOTEAM" value="" size="5"></td></tr>
<td>工程編號:</td><td><input class="text" name="COMBOCODE" value="" size="5"></td></tr>
<td></td><td><select disabled>
<option value="">全部</option>
<option value="">未完工</option>
<option value="">已完工</option>
<option value="">逾時案件</option>
</select></td></tr>
<td></td><td><input class="button" type="submit" value="查詢"></td></tr>
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
