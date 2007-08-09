問題:<br>
<li><a href="l.asp?P=search&SP=11">結果</a><br>
<li><a href="l.asp?P=search&SP=12">地區</a><br>
<br>
<br>
TOP 100:
<%
      Response.Write(str);
      obj.ClearAll();
      obj.NewQuery("SELECT COUNT(*) AS ID \
         FROM visits \
         WHERE (phone LIKE '%[-a-z]%' OR LEN(phone)!=8 OR LEN(serial) < 12) \
         AND COMPANYID='"+company_id+"'");
      obj.NewTemplate(MMSitePath+"id.wet");
      obj.DirectResponse = 1;
      var count = obj.GenerateString(0,0);
      Response.Write("(<strong>"+count+"</strong> records)<br>");
%>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+" AND COMPANYID='"+company_id+"')";
      else cond1 = " AND COMPANYID='"+company_id+"'"
      

      obj.NewQuery("SELECT TOP 100 visits.*, \
         CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, \
         ISNULL(visits.RESULT,'') AS R, \
         '0' AS ZAIPAIOK \
         FROM visits \
         WHERE (phone LIKE '%[-a-z]%' OR LEN(phone)!=8 OR LEN(serial) < 12) "+cond1+" ORDER BY visits.PHONE");
      obj.NewTemplate(SitePath+"search\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
