<%
var e = String(Request("E"));
if(e=="1") Response.Write("���±z�I");
else {
%>



��p�I���z�O�ߡA��g�U�C��ơC�ڭ̱N�|���ֳB�z�A���±z�I

<%
   var k = String(Request("K"));

  
   obj.ClearAll();
   obj.AddVar("name="+GetSession("PHONENAME"));
   obj.AddVar("code="+GetSession("PHONECODE"));

   obj.NewQuery("SELECT * FROM visits WHERE ID="+k);
   obj.NewTemplate(SitePath+"visits\\complain\\complain.wet");

   obj.Generate(0,0);
   }
%>