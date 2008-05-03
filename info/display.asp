<%@ language="javascript"%>
<!--#include file="../init.asp"-->
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.ClearAll();
   var k = String(Request("K"));
   obj.NewQuery("SELECT * FROM info LEFT OUTER JOIN REPORTERS ON REPORTERS.ID=INFO.MEMBERID WHERE info.ID='"+k+"'");
   obj.NewTemplate(SitePath+"info\\display.wet");
   obj.DirectResponse = 1;
   Response.Write(escape(obj.GenerateString(0,0)));
%>
