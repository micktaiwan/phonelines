<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT JOBCODE FROM BOMJOB WHERE ID=bomteamjob.JOBID) AS JOBCODE, \
         (SELECT IDNUMBER FROM BOMDATA WHERE ID=bomteamjob.WORKID) AS WORKCODE, \
         (SELECT ITEM FROM BOMITEMS WHERE ID=bomteamjob.SUBJECTID) AS SUBJECTITEM, \
         (SELECT CODE FROM BOMASCODE WHERE ID=bomteamjob.ASID) AS ASCODE, \
         (SELECT CODE FROM BOMMATERIAL WHERE ID=bomteamjob.MATID) AS MATCODE \
         FROM BOMTEAMJOB where id='"+k+"'");
      obj.NewTemplate(SitePath+"bom\\job\\teamjob\\edit.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
