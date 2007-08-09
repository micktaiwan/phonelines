<% @ Language="JavaScript" %>
<!--#include file="../../func.asp"-->
<!--#include file="../get_vars.asp"-->
<!--#include file="../../virtual.asp"-->
<%
   var a = GetSession("PHONEADMIN")
   if(a != '1' && a != '2' && a!= '5') { // not an admin, forbidden
      Response.Write("1");
      Response.End();
      }

   // TODO: Verify that this gift was not already given
   // Response.Write("2");
   // Response.End();
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM "+ sectable  +" WHERE MAINID=" + k);
   obj.Execute("DELETE FROM "+ maintable +" WHERE ID=" + k);
   obj = "";
   Response.Write("0"+k);
%>

