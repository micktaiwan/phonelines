<% @ Language="JavaScript" %>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("PHONE","sa","engine");
   var k = String(Request("K"));
   obj.Execute("DELETE FROM contacts WHERE ID = " + k);
   obj = "";
   Response.Redirect("../l.asp?P=contacts");   
%>

