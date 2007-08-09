<%@ language="javascript"%>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("phone","sa","engine");
   obj.SetTimeFormat("tt hh:mm:ss");
   var k = String(Request("K"));
   obj.Modify("CASES",k);
   obj = "";
   Response.Redirect("../l.asp?P=cases");   
%>

