<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var ids = String(Request("IDS"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   ids = ids.substring(0,ids.length-1);
   obj.Execute("DELETE FROM GIFTGIVEN WHERE VISITID IN("+ids+")");
   obj = "";
%>
