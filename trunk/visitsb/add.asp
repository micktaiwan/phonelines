<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.Redirect(Depth+QS+"welcome");

   Session("RESP") = String(Request("RESPONSIBLE"));
   var date = String(Request("DATE"));
   if(date=="undefined") {
      Response.Write("Date is undefined");
      Response.Ednf();
      }
   Session("DATE") = date;
   Session("ZONE") = String(Request("ZONE"));
   Session("TEAM") = String(Request("TEAM"));
   Session("AMPM") = String(Request("AMPM"));
   var phone = String(Request("PHONE"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   
   obj.NewQuery("SELECT TOP 1 ID FROM visitsb WHERE PHONE='" + phone + "' AND date='" + date + "'");
   obj.NewTemplate(SitePath+"id.wet");
   k = obj.GenerateString(0,0);
   if(k!="") {
      obj = "";
      Response.Redirect(Depth+QS+"visitsb&SP=add&E=2");
      }
   else obj.Insert("visitsb");
  
   obj = "";
   Response.Redirect(Depth+QS+"visitsb&SP=add&E=1");
%>
