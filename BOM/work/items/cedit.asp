<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM BOMITEMS where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\work\\items\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
