<%@ language="javascript"%>
<!--#include file="../../func.asp"-->
<!--#include file="../get_vars.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")=="0") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   // Look if the code is already here

   var code = String(Request("CODE"));
   var maintable = String(Request("M"));
   if(maintable != "mat") {
      obj.NewQuery("SELECT ID FROM "+maintable+" WHERE CODE='"+code+"'");
      obj.NewTemplate(SitePath+"id.wet");
      var e = "1";
      if(String(obj.GenerateString(0,0))!="") e = "2";
      else obj.Insert(maintable);
      }
   obj.Insert(maintable);
   obj = "";
   var sp = Request("SP");
   Response.Redirect(Depth+"../"+QS+"gifts&SP="+sp+"&E="+e);
%>
