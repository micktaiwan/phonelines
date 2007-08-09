<%
      obj.ClearAll();
      var k = String(Request("K"));

      obj.NewQuery("SELECT * FROM repairlog where id="+k);
      obj.NewTemplate(SitePath+"repairlog\\edit.wet");

      obj.NewQuery("SELECT * FROM problem ORDER BY CODE");
      obj.NewTemplate(SitePath+"codename.wet");

      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
