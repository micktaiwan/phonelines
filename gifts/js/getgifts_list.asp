<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp"-->
<%
   try {
   var ids = String(Request("IDS"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   ids = ids.split(",");
   var rv = "";
   var gifts;
   for(i=0; i<ids.length;++i) {
      if(ids[i]=="") continue;
      obj.ClearAll();
      obj.NewQuery("SELECT "+maintable+".CODE, "+maintable+".NAME, SUM("+sectable+".NB) AS NB FROM "+sectable+" LEFT OUTER JOIN "+maintable+" ON "+maintable+".ID="+sectable+".MAINID LEFT OUTER JOIN VISITS ON visits.ID="+sectable+".VISITID WHERE visits.ID='"+ids[i]+"' GROUP BY "+maintable+".NAME, "+maintable+".CODE");
      obj.NewTemplate(SitePath+"gifts\\js\\nb.wet");
      gifts = obj.GenerateString(0,0);
      if(gifts!="") rv += ids[i]+":"+ gifts + ";";
      }
   Response.Write(escape(rv));
   obj = "";
   }
   catch(e) {
      Response.Write("getgifts.asp error: "+escape(String(e)));
      }
%>


