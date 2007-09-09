<%@ language="javascript"%>
<!--#include file="init.asp"-->
<!--#include file="func.asp"-->
<!--#include file="virtual.asp"-->
<%
var obj = Server.CreateObject("MATech.Engine");
obj.SetDB(DB,"sa","engine");
obj.NewQuery("SELECT VISID, NAME, DATEDIFF(minute,DATE,getdate()) AS M, DATEDIFF(second,DATE,getdate()) AS S FROM VISITORS WHERE COMPANYID='"+company_id+"' ORDER BY DATE DESC");
obj.NewTemplate(SitePath+"visitors.wet");
rv = obj.GenerateString(0,0);
obj = ""
Response.Write(escape(rv));
%>
