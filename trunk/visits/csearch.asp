<%
//Response.Write(Request.Form.Count);
//Response.Write(Request.QueryString.Count);


if(Request.Form.Count > 0 || Request.QueryString.Count > 0) {
   Session("sRESP") = String(Request("RESPONSIBLE"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   Session("sZONE") = String(Request("ZONE"));
   Session("sTEAM") = String(Request("TEAM"));
   Session("sAMPM") = String(Request("AMPM"));
   Session("sPHONE") = String(Request("PHONE"));
   Session("sSERIAL") = String(Request("SERIAL"));
   Session("sRESULT") = String(Request("RESULT"));
   }

var resp = und(GetSession("sresp"));
var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
var zone = und(GetSession("szone"));
var team = und(GetSession("steam"));
var ampm = und(GetSession("sampm"));
var result = und(GetSession("sRESULT"));
var phone = und(String(Request("PHONE")));
var serial = und(String(Request("SERIAL")));
%>
<!--
<form name="addform" action="l.asp?P=visits&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<%if(GetSession("PHONEADMIN")!="0") {%>
<tr><td>輸入員: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>從日期: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>"></td></tr>
<tr><td>到日期: </td><td><input type="text" name="DATETO" value="<%=dateto%>"></td></tr>
<tr><td>地區: </td><td><input type="text" name="ZONE" value="<%=zone%>"></td></tr>
<tr><td>班別: </td><td><input type="text" name="TEAM" value="<%=team%>"></td></tr>
<% } %>
<tr><td>聯單: </td><td><input type="text" name="SERIAL" value="<%=serial%>"></td></tr>
<tr><td>電話: </td><td><input type="text" name="PHONE" value="<%=phone%>"></td></tr>
<%if(GetSession("PHONEADMIN")!="0") {%>
<tr><td>上下: </td><td><input type="text" name="AMPM" value="<%=ampm%>"></td></tr>
<tr><td>結果: </td><td><input type="text" name="RESULT" value="<%=result%>"></td></tr>
<% } %>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="搜尋"></td></tr>
</table>
</form>
-->
<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
   var w = new Array();
   if(resp!="") w[1] = "visits.RESPONSIBLE ='"+resp+"'";
   if(zone!="") w[2] = "visits.ZONE ='"+zone+"'";
   if(team!="") w[3] = "visits.TEAM ='"+team+"'";
   if(ampm!="") w[4] = "visits.AMPM ='"+ampm+"'";
   if(dateto!="")   w[5] = "visits.DATE <= '"+dateto+"'";
   if(datefrom!="") w[6] = "visits.DATE >= '"+datefrom+"'";
   if(result!="") w[7] = "visits.RESULT = '"+result+"'";
   if(phone!="") w[8] = "visits.PHONE = '"+phone+"'";
   if(serial!="") w[9] = "visits.SERIAL = '"+serial+"'";

   var str = "";
   for(i=1; i < 10; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }

   Response.Write(str);
   if(str!="") {
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
      obj.NewQuery("SELECT visits.*, ISNULL(visits.RESULT,'') AS RESULT, personnel.NAME, personnel.PHONES, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE  FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM AND personnel.COMPANYID='"+company_id+"' LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE "+str+cond1+" AND visits.COMPANYID='"+company_id+"' ORDER BY visits.DATE DESC");
      obj.NewTemplate(SitePath+"visits\\search.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
      }
%>


</table>