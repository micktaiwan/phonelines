<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   if(GetSession("PHONEADMIN") == "0") {
      Response.Write("You do not have permission to edit this database.");
      Response.End();
      }

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));

   obj.Modify("visitsb",k)

   obj = "";
   Response.Redirect("../l.asp?P=visitsb");
%>
