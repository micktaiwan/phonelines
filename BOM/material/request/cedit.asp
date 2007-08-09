<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT IDNUMBER FROM BOMDATA WHERE ID=bomrequest.WORKID) AS WCODE, (SELECT CODE FROM BOMMATERIAL WHERE ID=bomrequest.MATERIALID) AS MCODE FROM BOMrequest where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\material\\request\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
