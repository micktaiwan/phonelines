<%
   obj.ClearAll();
   var k = String(Request("K"));
   obj.NewQuery("SELECT * FROM holidays where id="+k);
   obj.NewTemplate(SitePath+"personnel\\holidays\\edit.wet");
   obj.NewQuery("SELECT ID,TEAM,NAME FROM PERSONNEL ORDER BY TEAM");
   obj.NewTemplate(SitePath+"personnel\\option.wet");
   obj.DirectResponse = 0;
   obj.Generate(0,0);
%>
