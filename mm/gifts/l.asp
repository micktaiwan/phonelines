<%
   obj.ClearAll();
   obj.NewQuery("select giftgiven.ID, giftgiven.NB, giftgiven.INSERTDATE, visits.phone, visits.team, visits.date, gifts.name from giftgiven left outer join visits on visits.id=giftgiven.visitid left outer join gifts on gifts.id=giftgiven.mainid");
   obj.NewTemplate(MMSitePath+"gifts\\tree.wet");
   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
