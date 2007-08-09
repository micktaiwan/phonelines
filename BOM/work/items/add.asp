<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("BOMITEMS");
   obj = "";

   Session("ITEMSADDI") = String(Request("ITEM"));
   Session("ITEMSADDC") = String(Request("CODE"));
   Session("ITEMSADDS") = String(Request("SUBJECT"));
   Session("ITEMSADDU") = String(Request("UNIT"));



   Response.Redirect("../../../l.asp?bom=1&P=items&SP=add");
%>
