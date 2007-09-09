<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp" -->
<%
   try {
      var ids = String(Request("IDS"));
      var team = und(String(Request("T")));
      var zone = String(Request("Z"));

      var obj = Server.CreateObject("MATech.Engine");
      obj.SetDB(DB,"sa","engine");
      ids = ids.split(",");
      var rv = "";
      var gifts;
      for(i=0; i<ids.length;++i) {
         if(ids[i]=="") continue;
         obj.ClearAll();
         var sql = "SELECT "+maintable+".CODE, "+maintable+".NAME, SUM("+sectable+".NB) AS NB FROM "+sectable+" LEFT OUTER JOIN "+maintable+" ON "+maintable+".ID="+sectable+".MAINID LEFT OUTER JOIN VISITS ON visits.ID="+sectable+".VISITID WHERE visits.DATE='"+ids[i]+"'";
         if(zone!="") sql += " AND visits.ZONE='"+zone+"'";
         if(team!="") sql += " AND visits.TEAM='"+team+"'";
         sql += " GROUP BY "+maintable+".NAME, "+maintable+".CODE";
         obj.NewQuery(sql);
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


