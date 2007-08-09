<%
   obj.ClearAll();
   var k = String(Request("K"));

   var isnew = "CASE WHEN DATEDIFF(hour,REPORTDATE,GETDATE()) < 24 THEN'1' ELSE '0' END AS NEW";
   obj.NewQuery("SELECT TOP 1 *, "+isnew+" FROM visits LEFT OUTER JOIN repairlog on visits.id = repairlog.VISITID where visits.id="+k);
   //obj.NewQuery("SELECT * FROM visits where visits.id="+k);
   obj.NewTemplate(SitePath+"repairlog\\addfromvisit.wet");

   obj.NewQuery("SELECT * FROM problem ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");

   obj.DirectResponse = 0;
   obj.AddVar("Reporter="+GetSession("PHONECODE"));
   obj.Generate(0,0);
%>

