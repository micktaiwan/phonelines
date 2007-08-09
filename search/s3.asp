<%
//Response.Write(Request.Form.Count);
//Response.Write(Request.QueryString.Count);

if(Request.Form.Count > 0) {
   Session("sTEAM") = String(Request("TEAM"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   }
var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
var result = "障礙";
var team = und(GetSession("steam"));
%>

<script language="javascript">

   function searchsub() {
      var form = document.addform;
      if(!checkNull(form.DATEFROM,"從日期")) return false;
      if(!checkNull(form.DATETO,"到日期")) return false;
   	form.submit();
   	return true;

      }

</script>

<form name="addform" action="l.asp?P=search&SP=<%=sp%>" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>班別: </td><td><input type="text" name="TEAM" value="<%=team%>" class="a90" style="height:14pt"></td></tr>
<tr><td>從日期: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATEFROM.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>到日期: </td><td><input type="text" name="DATETO" value="<%=dateto%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATETO.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="searchsub()" value=" 搜　尋 " class="a90" style="height:14pt"></td></tr>
</table>
</form>

<%
   var w = new Array();
   if(team!="") w[2] = "visits.TEAM ='"+team+"'";
   if(dateto!="")   w[3] = "visits.DATE <= '"+dateto+"'";
   if(datefrom!="") w[4] = "visits.DATE >= '"+datefrom+"'";

   var str = "";
   for(i=2; i <= 4; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }

   if(result!="undefined") {
      if(str!="") str += " AND ";
      str += "result='"+result+"'";
      }

   if(str!="" && Request.Form.Count > 0) {
%>
      <table cellspacing="1" cellpadding="2" bgcolor="black">
      <!--#include file="../visits/tableheader.inc" -->
<%
      Response.Write(str);
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";

      var sql = "SELECT distinct visits.*, ISNULL(visits.RESULT,'') AS RESULT, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM AND personnel.COMPANYID='"+company_id+"' LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE "+str+cond1+" AND visits.COMPANYID='"+company_id+"' ORDER BY visits.PHONE";
      obj.NewQuery(sql);
      obj.NewTemplate(SitePath+"search\\s3.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
      </table>
<%
      }
   //Response.Write(sql);
%>
