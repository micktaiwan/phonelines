<style>
.nb {color:red;font-weight:bold;}
</style>

<%
if(Request.Form.Count > 0) {
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   Session("sZONE") = String(Request("ZONE"));
   }

var zone = und(GetSession("szone"));
var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
%>

<form name="sform" action="l.asp?P=repairlog&SP=reportstats" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�a�ϡG</td><td><input type="text" name="ZONE" value="<%=zone%>"></td></tr>
<tr><td>�q���: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>">[ <a href="#" onclick="sform.DATEFROM.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>����: </td><td><input type="text" name="DATETO" value="<%=dateto%>">[ <a href="#" onclick="sform.DATETO.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="�j�M"></td></tr>
</table>
</form>


<%
if(Request.Form.Count > 0) {
%>
�a�ϡG<%= zone %>  �q����G<%= datefrom %> �����G<%= dateto %>

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
   where = ""
   if(zone!="" || datefrom != "" || dateto!="") {
      cond = new Array
      if(zone != "")       cond.push("ZONE='"+zone+"'");
      if(datefrom != "")   cond.push("DATE>='"+datefrom+"'");
      if(dateto != "")     cond.push("DATE<='"+dateto+"'");
      where += "WHERE " + cond.join(" AND ")
      }
   where += " AND V.COMPANYID='"+company_id+"'"
   sql += "V.TEAM from repairlog L join visits V on V.ID=L.VISITID "+where+" GROUP BY V.TEAM order by V.TEAM"
   //Response.write(sql);
   obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"repairlog/report_stats.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
<%
}
%>
