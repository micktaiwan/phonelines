<li><font><b>�޲z�j�v</b></font> (5)<br>
<li><font color="red"><b>���</b></font> (2)<br>
<li><strong>�޲z�H</strong> (1)<br>
<li><font color="blue">�W�H</font> (3)<br>
<li>�Z�H (0)<br>
<li><font color="#777700">�u�Z</font> (4)<br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�s��</td>
<td colspan="2">�W��</td>
<td>�N�X</td>
<td>�K�X</td>
<td>�a��</td>
<td>²�T�b��</td>
<td>�u�{</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      obj.NewQuery("SELECT reporters.*, (SELECT NAME FROM REPORTERGROUPS WHERE ID=reporters.GROUPID) AS GROUPNAME, smshn.NAME AS SMSHNNAME FROM reporters LEFT OUTER JOIN SMSHN ON smshn.ID=reporters.SMSHNID WHERE reporters.companyid='"+company_id+"' ORDER BY ADMIN DESC, CODE");
      obj.NewQuery("SELECT zones.NAME FROM repzones LEFT OUTER JOIN zones ON zones.ID=repzones.ZONE WHERE REP=# ORDER BY zones.CODE");
      obj.NewTemplate(SitePath+"reporters\\tree.wet");
      obj.NewTemplate(SitePath+"reporters\\zonelist.wet");
      obj.DirectResponse = 1; // should be 0
      obj.Generate(0,0);
%>


</table>
<br>
<!--
<br>
�n�J�O��:<br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�W��</td>
<td>���</td>
<td>IP</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 25 * FROM logins ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"reporters\\logins.wet");
      obj.DirectResponse = 1;
      //obj.Generate(0,0);
%>
</table>
-->
