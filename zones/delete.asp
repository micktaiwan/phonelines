<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN")!= "1" && GetSession("PHONEADMIN")!= "2") {
      Response.Write("You are not an administrator");
      Response.End();
      }


   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM zones WHERE ID=" + k);

   obj = "";
   Response.Redirect("../l.asp?P=zones");
%>

