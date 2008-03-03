<%@ language="javascript"%>
<!--#include file="..\init.asp"-->
<!--#include file="..\func.asp"-->
<!--#include file="..\virtual.asp"-->

NOT USED !!!!

<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
	obj.ClearAll();
	obj.AddVar(GetSession("PHONEADMIN"));
	if(admin!="3")
		obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID ORDER BY visits.ID DESC");
	else 
		obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+" ) ORDER BY visits.ID DESC");
	obj.NewTemplate(SitePath+"visits\\tree.wet");

	Response.Write(escape(obj.GenerateString(0,0)));
	obj = ""
%>
