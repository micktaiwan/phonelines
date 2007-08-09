 <table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td>工作</td>
<td>工程編號</td>
<td>工作單編號</td>
<td>自編流水</td>
<td>施工地點</td>
<td>局交件日</td>
<td>預定完工日</td>
<td>預估點數</td>
<td>急件</td>
<td>班別</td>
<td>班收件日</td>
<td>班竣工日</td>
<td>班交圖日</td>
<td>局派工日</td>
<td>局報竣日</td>
<td>局圖竣日</td>
<td>退件日</td>
<td>退件原因</td>
<td>備註</td>
</tr>

<%
   var workcode   = String(Request("workCODE"));
   var jobcode    = String(Request("JOBCODE"));
   var ourcode    = String(Request("OURCODE"));
   var team       = String(Request("TEAM"));
   var datea      = String(Request("DATEA"));
   var dateb      = String(Request("DATEB"));
   var late       = String(Request("LATE"));
   var moneyreq   = String(Request("MONEYREQ"));
   var comboteam  = String(Request("COMBOTEAM"));
   var combocode  = String(Request("COMBOCODE"));
   var where      = "";
   if(workcode      != "undefined") where = "bomdata.IDNUMBER='"+workcode+"'"
   else if(jobcode  != "undefined") where = "bomjob.JOBCODE='"+jobcode+"'"
   else if(ourcode  != "undefined") where = "bomjob.OURCODE LIKE '%"+ourcode+"%'"
   else if(team != "undefined") {
      where = "ISNULL(bomjob.DATEA,'')=''"
      if(team != "") where += " AND bomjob.TEAM='"+team+"'";
      }
   else if(datea != "undefined") where = "bomjob.getdate BETWEEN '"+datea+"' AND '"+dateb+"'"
   else if(late != "undefined") where = "bomjob.EXPECTEDDATE<=GETDATE()"
   else if(moneyreq != "undefined") where = "bomjob.MONEYREQ='"+moneyreq+"'";
   else if(comboteam != "undefined" || combocode != "undefined") {
      if(comboteam != "")
         where = "bomjob.TEAM='"+comboteam+"'";
      if(combocode != "") {
         if(where!="") where += " AND ";
         where += "bomdata.IDNUMBER='"+combocode+"'";
         }
      }

   if(where!="") {
      where = "WHERE " + where;
      Response.Write(where);
      }
   else Response.Write("No search");

   obj.ClearAll();
   obj.NewQuery("SELECT bomjob.ID AS JOBID, bomjob.GETDATE, \
      bomdata.IDNUMBER, bomjob.OURCODE, bomjob.JOBCODE, bomjob.PLACE, bomjob.CANCELDATE, bomjob.CANCELREASON, \
      bomjob.EXPECTEDDATE, bomjob.POINTS, bomjob.URGENTDATE, bomjob.TEAM, bomjob.TEAMPICDATE, bomjob.TEAMGETDATE, bomjob.TEAMFINISHEDDATE, bomjob.DATEA, bomjob.DATEB, \
      bomjob.DATEC, bomjob.MEMO \
      from bomjob \
      LEFT OUTER JOIN bomdata ON bomdata.ID=bomjob.WORKID \
      "+where+" \
      ORDER BY bomjob.ID");
   obj.NewTemplate(SitePath+"bom\\search\\tree.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>
