<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   
   // Look if the team is already here
   
   var team = String(Request("TEAM"));
   var k = String(Request("REP"));   
   obj.NewQuery("SELECT ID FROM repteam WHERE TEAM="+team+" AND REP="+k);
   obj.NewTemplate(SitePath+"id.wet");
   if(String(obj.GenerateString(0,0))=="") obj.Insert("repteam");
   
   obj = "";
   Response.Redirect(Depth+QS+"reporters&SP=edit&K="+k);
%>
