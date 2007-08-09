<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<%
var d   =String(Request("D"));
var dd = d.split("!");
var from = dd[0];
var to   = dd[1];
var obj = Server.CreateObject("MATech.Engine");
obj.SetDB("phone","sa","engine");
obj.NewQuery("SELECT PATH, ZONE FROM STATS WHERE [FROM]='"+from+"' AND [TO]='"+to+"' ORDER BY ZONE");
obj.NewTemplate(SitePath+"search\\stats\\get_zones.wet");
obj.DirectResponse = 1;
obj.Generate(0,0);
obj = ""
%>
