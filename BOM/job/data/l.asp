<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.GETDATE.value)) {
         alert('Verify the 日期 field');
         f.GETDATE.focus();
         return false;
         }
      if(f.EXPECTEDDATE.value!='' && !isValidDate(f.EXPECTEDDATE.value)) {
         alert('Verify the 日期 field');
         f.EXPECTEDDATE.focus();
         return false;
         }
      if(!f.ABORTDATE.value!="" &&  isValidDate(f.ABORTDATE.value)) {
         alert('Verify the 日期 field');
         f.ABORTDATE.focus();
         return false;
         }
      f.submit();
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=jdata&SP=add">增加</a>
<br>
<br>
<%
   switch(sp.toLowerCase()) {
      case "undefined" :
      case "welcome" :
        %><!--#include file="ctree.asp" --><%
      	break;
      case "add" :
        %><!--#include file="cadd.asp" --><%
      	break;
      case "edit" :
        %><!--#include file="cedit.asp" --><%
      	break;
      default:
%>
<br>
This page can not be found<br>
<br>
<% 	} // switch %>
