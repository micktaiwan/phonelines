<script language="javascript1.2">
function checkedit(form) {
   if(!isValidDate(form.DATE.value,"YMD")) {
      form.DATE.focus();
      alert('bad date');
      return false;
      }
   form.submit();
   return true;
   }
</script>

<%
   if(admin!="4") {
      obj.ClearAll();
      var k = String(Request("K"));
      obj.NewQuery("SELECT * FROM visits where id="+k);
      obj.NewTemplate(SitePath+"visits\\edit.wet");
      obj.Generate(0,0);
      }
%>
