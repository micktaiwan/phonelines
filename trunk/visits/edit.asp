<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN") == "0") Response.Redirect(Depth+QS+"welcome");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
	if(k!="undefined")	
		obj.Modify("visits",k)

   obj = "";
	var r = unescape(String(Request("R")))
	if(r!= "undefined")
		Response.Redirect(r);   
	else	
		Response.Redirect("../l.asp?P=visits");   
%>
