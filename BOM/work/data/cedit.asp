<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM bomdata where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\work\\data\\edit.wet");
      obj.NewQuery("SELECT ID,CODE,NAME FROM REPORTERS WHERE BOM=1 ORDER BY CODE");
      obj.NewTemplate(SitePath+"reporters\\option.wet");
      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
