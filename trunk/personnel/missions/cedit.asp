<%
   obj.ClearAll();
   var k = String(Request("K"));
   obj.NewQuery("SELECT * FROM missions where id="+k);
   obj.NewTemplate(SitePath+"personnel\\missions\\edit.wet");
   obj.NewQuery("SELECT ID,TEAM,NAME FROM PERSONNEL ORDER BY TEAM");
   obj.NewTemplate(SitePath+"personnel\\option.wet");
   obj.DirectResponse = 0;
   obj.Generate(0,0);
%>
