<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%

   Session("BOMMATCODE") = String(Request("CODE"));
   Session("BOMMATSUPPLIER") = String(Request("SUPPLIER"));
   Session("BOMMATNAME") = String(Request("NAME"));
   Session("BOMMATUNIT") = String(Request("UNIT"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMMATERIAL");
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=mdata");
%>
