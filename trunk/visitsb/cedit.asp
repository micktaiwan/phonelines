<script language="javascript1.2">
function checkedit(form) {
<%
if(admin!="4") {
%>

   if(!isValidDate(form.DATE.value,"YMD")) {
      form.DATE.focus();
      alert('bad date');
      return false;
      }
<%
}
%>

   form.submit();
   return true;
   }
</script>

<%
      obj.ClearAll();
      var k = String(Request("K"));
      obj.NewQuery("SELECT * FROM visitsb where id="+k);
      obj.NewTemplate(SitePath+"visitsb\\edit.wet");
      obj.AddVar(admin);
      obj.Generate(0,0);
%>
