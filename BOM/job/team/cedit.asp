<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT CODE FROM BOMJOB WHERE ID=bomteam.JOBID) AS CODE FROM BOMTEAM where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\job\\team\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
