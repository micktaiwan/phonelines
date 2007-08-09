<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT CODE FROM BOMMATERIAL WHERE ID=BOMTEAMMAT.MATERIALID) AS MCODE FROM BOMTEAMMAT where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\material\\team\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
