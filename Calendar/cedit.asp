<script language="javascript">

   function submitaddform() {
      String.prototype.Trim  = new Function("return this.replace(/^\\s+|\\s+$/g,'')")
      String.prototype.ReplaceQuote  = new Function("return this.replace(/\"/g,'*')")
      var f = document.addform;
      f.TITLE.value = f.TITLE.value.Trim().ReplaceQuote();
      d = f.YEAR.value+"/"+f.MONTH.value+"/"+f.DAY.value;
      if(!isValidDate(d)) {
         alert("Bad date");
         return false;
         }
      f.submit();
      return true;
      }

</script>
<%
   obj.ClearAll();
   var k = String(Request("K"));

   obj.NewQuery("SELECT calendar.*, reporters.NAME FROM calendar LEFT OUTER JOIN reporters ON calendar.MEMBERID=reporters.ID WHERE calendar.ID='"+k+"'");
   obj.NewTemplate(SitePath+"calendar\\edit.wet");

   obj.AddVar("Title=主旨");
   obj.AddVar("Details=內容");
   obj.AddVar("Date=日期");
   obj.AddVar("Private=不公開 ");
   obj.AddVar("Public=公開 ");
   obj.AddVar("Alert=alert");
   obj.AddVar("Change=更改");
   obj.Generate(0,0);
%>
