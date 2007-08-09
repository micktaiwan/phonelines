<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM BOMASCODE where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\work\\ascode\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
