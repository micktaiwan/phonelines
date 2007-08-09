<%@ language="javascript"%>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   obj.Insert("CASES");
   obj = "";
   Response.Redirect("../l.asp?P=cases&SP=add&E=1");
%>
