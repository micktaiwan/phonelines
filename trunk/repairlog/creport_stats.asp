<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�Z�O</td><td>123</td><td>128</td><td>�Ȥ�</td><td>�A�Ȥ���</td><td>�䥦</td>
</tr>
<%
   obj.ClearAll();
   var sql = "SELECT "
   sql += "(SELECT COUNT(*) FROM repairlog JOIN visits on visits.id=repairlog.visitid WHERE ORIGIN='123' and visits.TEAM=V.TEAM) AS CA, "
   sql += "(SELECT COUNT(*) FROM repairlog JOIN visits on visits.id=repairlog.visitid WHERE ORIGIN='128' and visits.TEAM=V.TEAM) AS CB, "
   sql += "(SELECT COUNT(*) FROM repairlog JOIN visits on visits.id=repairlog.visitid WHERE ORIGIN='�Ȥ�' and visits.TEAM=V.TEAM) AS CC, "
   sql += "(SELECT COUNT(*) FROM repairlog JOIN visits on visits.id=repairlog.visitid WHERE ORIGIN='�A�Ȥ���' and visits.TEAM=V.TEAM) AS CD, "
   sql += "(SELECT COUNT(*) FROM repairlog JOIN visits on visits.id=repairlog.visitid WHERE ORIGIN='�䥦' and visits.TEAM=V.TEAM) AS CE, "
   sql += "V.TEAM from repairlog L join visits V on V.ID=L.VISITID GROUP BY V.TEAM order by V.TEAM"
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"repairlog/report_stats.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
