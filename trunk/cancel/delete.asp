<% @ Language="JavaScript" %>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   //if(GetSession("PHONEADMIN")!= "1") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM cancel WHERE ID="+k);
   obj = "";
   Response.Redirect("../l.asp?P=cancel");
%>

