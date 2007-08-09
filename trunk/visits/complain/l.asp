<%
var e = String(Request("E"));
if(e=="1") Response.Write("謝謝您！");
else {
%>



抱歉！讓您費心，填寫下列資料。我們將會儘快處理，謝謝您！

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