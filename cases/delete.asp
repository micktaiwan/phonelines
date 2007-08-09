<% @ Language="JavaScript" %>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM CASES WHERE ID = " + k);
   obj = "";
   Response.Redirect("../l.asp?P=cases");   
%>

