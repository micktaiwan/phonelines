<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<%
var s   =String(Request("S"));
var len = s.length;
var obj = Server.CreateObject("MATech.Engine");
obj.SetDB("phone","sa","engine");
obj.NewQuery("SELECT ZONE FROM VISITS WHERE LEFT(ZONE,"+len+")='"+s+"' GROUP BY ZONE ORDER BY ZONE");
obj.NewTemplate(SitePath+"search\\getzones.wet");
obj.DirectResponse = 1;
obj.Generate(0,0);
obj = ""
%>
