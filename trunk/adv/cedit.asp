<script language="javascript" src="verifdate.js"></script>

<script language="javascript">
   function limitchange() {
      var f = document.addform;
      if(f.TIMELIMIT.value=="0") f.TODATE.value='';
      else f.TODATE.value='<%=MyNow()%>';
      }

   function submitaddform() {
      var f = document.addform;
      if(f.NAME.value=="") {
         alert('Verify the name field');
         f.NAME.focus();
         return false;
         }
      if(f.TYPE.value=="1" && (f.TEXT.value == "" || f.TEXT.value.length > 38)) {
         alert('Verify the text field');
         f.TEXT.focus();
         return false;
         }
      if(!isValidDate(f.FROMDATE.value)) {
         alert('Verify the 從日期 field');
         f.FROMDATE.focus();
         return false;
         }
      if(f.TIMELIMIT.value=="1" && !isValidDate(f.TODATE.value)) {
         alert('Verify the 到日期 field');
         f.TODATE.focus();
         return false;
         }
      if(f.TYPE.value=="0" && f.FILEPATH.value=="") {
         alert('Verify the 圖片 field');
         f.FILEPATH.focus();
         return false;
         }
       f.submit();
      return true;
      }
</script>

<%
   var k = String(Request("K"));
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM banners WHERE ID='"+k+"'");
   obj.NewTemplate(SitePath+"adv\\edit.wet");
   obj.Generate(0,0);
%>
