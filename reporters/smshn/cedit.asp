<script language="javascript">
   function verifform() {
      var f = document.smsform;
      if(f.HN.value.length!=8) {
         alert("bad HN number");
         f.HN.focus();
         return;
         }
      if(f.PASS.value.length!=8) {
         alert("bad pass");
         f.PASS.focus();
         return;
         }
      f.submit();
      }

</script>

<%
   obj.ClearAll();
   var k = String(Request("K"));
   obj.NewQuery("SELECT * FROM smshn WHERE ID="+k);
   obj.NewTemplate(SitePath+"reporters\\smshn\\edit.wet");
   obj.Generate(0,0);
%>
