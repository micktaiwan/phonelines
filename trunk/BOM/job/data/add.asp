<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMJOB");
   obj = "";
   var c = String(Request("CODE"));
   Response.Redirect("../../../l.asp?bom=1&P=jdata&SP=add&C="+c);
%>
