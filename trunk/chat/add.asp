<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<!--#include file="../func.asp" -->
<%
   var name = unescape(String(Request("N")));
   var text = unescape(String(Request("T")));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("INSERT INTO CHAT (NAME,TEXT) VALUES ('"+ToSQL(name)+"','"+ToSQL(text)+"')");
%>
<!--#include file="ctree.asp"-->
<%
   obj = "";
%>
