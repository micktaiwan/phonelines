<% if(admin!="0") { %>

Top 30:<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(admin);
      var cond1 = "";
      //if(admin=="3") cond1 = "WHERE visitsb.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
      obj.NewQuery("SELECT TOP 30 visitsb.*, CASE WHEN visitsb.phone LIKE '%[-a-z]%' THEN '1' WHEN visitsb.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME FROM visitsb LEFT OUTER JOIN personnel ON visitsb.TEAM=personnel.TEAM "+cond1+" ORDER BY visitsb.DATE DESC");
      obj.NewTemplate(SitePath+"visitsb\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>

<% } %>
