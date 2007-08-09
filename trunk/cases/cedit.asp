<%
   obj.ClearAll();
   var k = String(Request("K"));

   obj.NewQuery("SELECT * FROM CASES WHERE ID="+k);
   obj.NewTemplate(SitePath+"cases/edit.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
