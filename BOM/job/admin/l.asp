<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.DATEA.value)) {
         alert('Verify the 日期 field');
         f.DATEA.focus();
         return false;
         }
      if(!isValidDate(f.DATEB.value)) {
         alert('Verify the 日期 field');
         f.DATEB.focus();
         return false;
         }
      if(!isValidDate(f.DATEC.value)) {
         alert('Verify the 日期 field');
         f.DATEC.focus();
         return false;
         }
      if(!checkNumber(f.MONEYREQ)) return false;
      openConfirm('bom/job/admin/cconfirm.asp?K='+f.JOBID.value,400,200);
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=admin&SP=add">增加</a>
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
