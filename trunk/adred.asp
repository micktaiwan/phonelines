<%@ language="javascript"%>
<!--#include file="func.asp"-->
<!--#include file="virtual.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var k = String(Request("K"));
   obj.Execute("UPDATE BANNERS SET NBCLICK=NBCLICK+1 WHERE ID='"+k+"'");
   obj.NewQuery("SELECT URL FROM BANNERS WHERE ID='"+k+"'");
   obj.NewTemplate(SitePath+"adv\\fullurl.wet");
   var url = obj.GenerateString(0,0);
   obj = "";

   Response.Redirect(url);
%>
