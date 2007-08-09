<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   
   // Look if the zone is already here
   
   var zone = String(Request("ZONE"));
   var k = String(Request("REP"));   
   obj.NewQuery("SELECT ID FROM repzones WHERE ZONE="+zone+" AND REP="+k);
   obj.NewTemplate(SitePath+"id.wet");
   if(String(obj.GenerateString(0,0))=="") obj.Insert("repzones");
   
   obj = "";
   Response.Redirect(Depth+QS+"reporters&SP=edit&K="+k);
%>
