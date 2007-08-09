<%
   obj.ClearAll();
   var k = String(Request("K"));

   obj.NewQuery("SELECT * FROM info WHERE ID="+k);
   obj.NewTemplate(SitePath+"info\\edit.wet");

   obj.Generate(0,0);
%>
