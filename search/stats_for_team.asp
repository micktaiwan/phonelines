<% @ language="javascript" %>
<!--#include file="../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var zone_txt = String(Request("Z"));
   var team = String(Request("T"));
   obj.Execute("if exists (select * from sysobjects where id = object_id('VisitsZone') and sysstat & 0xf = 2) DROP VIEW VisitsZone");
   obj.Execute("CREATE VIEW VisitsZone AS SELECT RESULT, TEAM, JOBTYPE FROM VISITS WHERE ZONE='"+zone_txt+"' AND TEAM='"+team+"'");
   // team
   Response.Write(team);
   var results = new Array("","(RESULT='µ¤¤u' or RESULT='»ÙÃª' or RESULT='­×´_') and ","RESULT='°h¥ó' and ","RESULT='¦A¬£' and");
   var a = "";
   var sql = "";
   // all results
   for (var i in results) {
      // jobtype
      for (var jobtype=0; jobtype<=5; jobtype++) {
         if(jobtype==4) a = "0";
         else {
            obj.Open("SELECT COUNT(*) AS A FROM VisitsZone WHERE "+results[i]+" JOBTYPE='"+jobtype+"'");
            a = obj.Field("A");
            }
         Response.Write("#");
         if(a!="0") Response.Write(a)
         } // job type
      } // result
   obj.Open("SELECT COUNT(*) AS A FROM VisitsZone WHERE RESULT='»ÙÃª'");
   var a = obj.Field("A");
   Response.Write("#");
   if(a!="0") Response.Write(a)
   Response.Write("#");
   obj = "";
%>
