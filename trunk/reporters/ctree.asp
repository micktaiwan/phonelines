<li><font><b>管理大師</b></font> (5)<br>
<li><font color="red"><b>國王</b></font> (2)<br>
<li><strong>管理人</strong> (1)<br>
<li><font color="blue">超人</font> (3)<br>
<li>凡人 (0)<br>
<li><font color="#777700">工班</font> (4)<br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>編輯</td>
<td colspan="2">名稱</td>
<td>代碼</td>
<td>密碼</td>
<td>地區</td>
<td>簡訊帳號</td>
<td>工程</td>
<td>刪除</td>
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
登入記錄:<br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>名稱</td>
<td>日期</td>
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
