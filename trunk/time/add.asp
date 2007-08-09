<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   
   // Look if the code is already here
   
   var code = String(Request("CODE"));
   obj.NewQuery("SELECT ID FROM time WHERE CODE='"+code+"'");
   obj.NewTemplate(SitePath+"id.wet");
   var e = "1";
   if(String(obj.GenerateString(0,0))!="") e = "2";
   else obj.Insert("time");
   
   obj = "";
   Response.Redirect(Depth+QS+"time&SP=add&E="+e);
%>
