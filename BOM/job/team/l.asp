<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.DATEA.value)) {
         alert('Verify the 日期 field');
         f.DATEA.focus();
         return false;
         }
/*
      if(!isValidDate(f.DATEB.value)) {
         alert('Verify the 日期 field');
         f.DATEB.focus();
         return false;
         }
*/
      //openConfirm('bom/job/team/cconfirm.asp?K='+f.JOBID.value,400,200);
      f.submit();
      return true;
      }
   function submiteditform() {
      var f = document.addform;
      if(!isValidDate(f.DATEA.value)) {
         alert('Verify the 日期 field');
         f.DATEA.focus();
         return false;
         }
/*
      if(!isValidDate(f.DATEB.value)) {
         alert('Verify the 日期 field');
         f.DATEB.focus();
         return false;
         }
*/
      openConfirm('bom/job/team/cconfirm.asp?K='+f.JOBID.value,400,200);
      //f.submit();
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=team&SP=add">增加</a>
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
