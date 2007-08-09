<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM BOMMATERIAL where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\material\\data\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
