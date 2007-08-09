<div class="noprint"><%
   // ----------
   // Top banner
   // ----------
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 1 ID FROM BANNERS WHERE TYPE=0 AND PLACE=0 AND DISABLED=0 AND (MAXVIEW=0 OR NBVIEW<MAXVIEW) AND DATEDIFF(day,GETDATE(),FROMDATE) <= 0 AND (TIMELIMIT=0 OR DATEDIFF(day,GETDATE(),TODATE) >= 0) AND companyid='"+company_id+"' ORDER BY NEWID()");
   obj.NewTemplate(MMSitePath+"id.wet");
   var adid = obj.GenerateString(0,0);
   if(adid!="") {
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM BANNERS WHERE ID='"+adid+"'");
      obj.NewTemplate(SitePath+"adv\\display.wet");
      obj.Generate(0,0);
      obj.Execute("UPDATE BANNERS SET NBVIEW=NBVIEW+1 WHERE ID='"+adid+"'");
      //Response.Write(adid);
      }%>
</div>
