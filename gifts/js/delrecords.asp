<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<!--#include file="../get_vars.asp"-->
<%
   var ids = String(Request("IDS"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   ids = ids.substring(0,ids.length-1);
   obj.Execute("DELETE FROM "+sectable+" WHERE VISITID IN("+ids+")");
   obj = "";
%>
