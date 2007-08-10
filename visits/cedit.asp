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
	var k = String(Request("K"));
	r = escape(String(Request.servervariables("http_referer")));
%>
<form name="addform" action="visits/edit.asp?K=<%=k%>&R=<%=r%>" method="post">
<%
   if(admin!="4") {
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM visits where id="+k);
      obj.NewTemplate(SitePath+"visits\\edit.wet");
      obj.Generate(0,0);
      }
%>
</form>
