<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM BOMJOB where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\job\\data\\edit.wet");
      obj.NewQuery("SELECT * FROM BOMDATA ORDER BY IDNUMBER");
      obj.NewTemplate(SitePath+"bom\\work\\data\\option2.wet");
      obj.Open("SELECT JOBCODE FROM BOMJOB where id='"+k+"'");
      var code = obj.Field("JOBCODE");
      Response.Write(code);
      obj.AddVar("C="+code);
      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
