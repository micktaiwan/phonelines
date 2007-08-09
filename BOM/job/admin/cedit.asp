<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT CODE FROM BOMJOB WHERE ID=BOMADMIN.JOBID) AS CODE FROM BOMADMIN where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\job\\admin\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
