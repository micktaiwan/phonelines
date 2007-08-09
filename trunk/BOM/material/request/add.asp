<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMrequest");
   obj = "";
   Session("matrequestDATE") = String(Request("DATE"));
   Session("matrequestCODE") = String(Request("CODE"));
   Response.Redirect("../../../l.asp?bom=1&P=request&SP=add2");
%>
