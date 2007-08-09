<%
   var k = String(Request("K")).split(", ");
   if(k[0]=="undefined") {
      obj = "";
      //Response.Write(k.length+"<br>");
      Response.Write("check a record first");
      Response.End();
      }

   var i = 0;
   var ids = "";
   for (i=0; i < k.length; i++) {
      if(k[i] == "") continue;

      obj.ClearAll();
      obj.Open("SELECT TOP 1 PHONE, DATE FROM VISITS WHERE ZAIPAIID='"+k[i]+"' OR (DATE >= '"+Tomorrow()+"' AND PHONE=(SELECT PHONE FROM VISITS WHERE ID='"+k[i]+"'))");
      var phone = obj.Field("PHONE");

      if(phone != "") {
         Response.Write(" <strong>¿ù»~: ­«½Æ</strong> phone=<b>"+phone+"</b> on "+obj.Field("DATE"));
         obj.Execute("INSERT INTO ZAIPAI (ZAIPAIID, VISID) VALUES ('"+k[i]+"','-1')");
         continue;
         }

      obj.Execute("INSERT INTO VISITS (DATE, ZONE, JOBTYPE, TEAM, SERIAL, PHONE, AMPM, RESPONSIBLE, CUSTNAME, CUSTADDRESS, CONTACTPHONE, CONTACTNAME, KPROBLEMID, ZAIPAIID) SELECT '"+Tomorrow()+"', ZONE, JOBTYPE, TEAM, SERIAL, PHONE, AMPM, RESPONSIBLE, CUSTNAME, CUSTADDRESS, CONTACTPHONE, CONTACTNAME, KPROBLEMID, '"+k[i]+"' FROM VISITS WHERE ID='"+k[i]+"'");
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 1 ID FROM VISITS WHERE ZAIPAIID='"+k[i]+"' ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"id.wet");
      if(ids!="") ids += ",";
      newid = obj.GenerateString(0,0);
      obj.Execute("INSERT INTO ZAIPAI (ZAIPAIID, VISID) VALUES ('"+k[i]+"','"+newid+"')");
      ids += newid;
      //Response.Write(k[i] + ": OK<br>");
      }

   if(ids != "") {
%>
<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 += "WHERE visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+id+")";
      if(cond1!="") cond1 += " AND "
      else cond1 += "WHERE "
      cond1 += "visits.ID IN ("+ids+")";

      obj.NewQuery("SELECT visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM AND personnel.COMPANYID='"+company_id+"' LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID "+cond1+" ORDER BY visits.DATE DESC");
      obj.NewTemplate(SitePath+"visits\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
<%    } %>