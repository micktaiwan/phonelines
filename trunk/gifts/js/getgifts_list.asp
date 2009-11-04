<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp"-->
<%
try {
   var ids = String(Request("IDS"));
   var type = und(String(Request("Y")));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   ids = ids.split(",");
   var rv = "";
   var gifts;
   for(i=0; i<ids.length;++i) {
      if(ids[i]=="") continue;
      obj.ClearAll();
		var sql = "SELECT "+maintable+".CODE, "+maintable+".NAME, SUM("+sectable+".NB) AS NB FROM "+sectable+" LEFT OUTER JOIN "+maintable+" ON "+maintable+".ID="+sectable+".MAINID LEFT OUTER JOIN VISITS ON visits.ID="+sectable+".VISITID WHERE "+sectable+".ID='"+ids[i]+"'"
		if(type != "") {
			switch(type) {
				case "0" : type_str="0,10"; break;
				case "1" : type_str="1,11"; break;
				case "2" : type_str="2,12"; break;
				}
			sql += " AND "+maintable+".type IN ("+type_str+")"
			}
		sql += " GROUP BY "+maintable+".NAME, "+maintable+".CODE"
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
