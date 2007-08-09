<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
	//Response.Write("1");

   p = String(Request("P"));
   Session("PHONEPASS") = p;

	var obj = Server.CreateObject("MATech.Engine");
	obj.SetDB(DB,"sa","engine");
	obj.Execute("UPDATE REPORTERS SET PASS='"+p+"' WHERE ID='"+GetSession("PHONEID")+"'");
   obj = ""
%>
