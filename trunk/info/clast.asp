<%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 1 * FROM info LEFT OUTER JOIN REPORTERS ON REPORTERS.ID=INFO.MEMBERID WHERE info.COMPANYID='"+company_id+"' ORDER BY DATE DESC");
   obj.NewTemplate(SitePath+"info\\display.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
<br>
