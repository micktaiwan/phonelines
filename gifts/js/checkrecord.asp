<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var date    = String(Request("D"));
   var team    = String(Request("T"));
   var phone   = String(Request("P"));
   var obj     = Server.CreateObject("MATech.Engine");
   var admin   = GetSession("PHONEADMIN");

   obj.SetDB(DB,"sa","engine");
   var visitid = "";
   try {
      obj.Open("SELECT TOP 1 ID FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
      visitid = obj.Field("ID");
      if(visitid=="") {
         Response.Write("");
         }
      else {
         obj.Open("SELECT RESULT FROM VISITS WHERE ID='"+visitid+"'");
         var result = obj.Field("RESULT");
         if(result=="µ¤¤u" || result=="»ÙÃª" || result=="­×´_") {
            //if(admin=="5")
            Response.Write(visitid);
            //else Response.Write(escape("+2"));
            }
         else
            Response.Write(escape("+1"));
         }
      }
   catch(e) {
      }
   obj = "";
%>
