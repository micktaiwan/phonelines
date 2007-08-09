<script language="javascript">

   function submitaddform() {
      String.prototype.Trim  = new Function("return this.replace(/^\\s+|\\s+$/g,'')")
      var f = document.addform;
      f.MEMO.value = f.MEMO.value.Trim();
      f.submit();
      return true;
      }

</script>

<%
      obj.ClearAll();
      var k = String(Request("K"));
      obj.NewQuery("SELECT * FROM visits where id="+k);
      obj.NewTemplate(SitePath+"visits\\editmemo.wet");
      obj.NewQuery("SELECT * FROM kproblem order by code");
      obj.NewTemplate(SitePath+"kproblem\\option.wet");
      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
