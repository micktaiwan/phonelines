<%
   obj.ClearAll();
   var k = String(Request("K"));
   obj.NewQuery("SELECT * FROM info LEFT OUTER JOIN REPORTERS ON REPORTERS.ID=INFO.MEMBERID WHERE info.ID='"+k+"'");
   obj.NewTemplate(SitePath+"info\\display.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
<br>
<!--#include file="ctree.asp"-->