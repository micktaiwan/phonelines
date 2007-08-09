<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.DATE.value)) {
         alert('Verify the 日期 field');
         f.DATE.focus();
         return false;
         }
      if(!checkNumber(f.QTY)) return false;
      if(!checkNumber(f.USEDQTY)) return false;
      if(!checkNumber(f.SURPLUS)) return false;
      if(!checkNumber(f.LOSS)) return false;
      openConfirm('bom/job/teamjob/cconfirm.asp?K='+f.WORKID.value+'&L='+f.JOBID.value+'&M='+f.SUBJECTID.value+'&N='+f.ASID.value+'&O='+f.MATID.value,600,350);
      return true;
      }

   function submitaddform2() {
      var f = document.addform;
      if(!isValidDate(f.DATE.value)) {
         alert('Verify the 日期 field');
         f.DATE.focus();
         return false;
         }
      //openConfirm('bom/job/teamjob/cconfirm.asp?K='+f.WORKID.value+'&L='+f.JOBID.value+'&M='+f.SUBJECTID.value+'&N='+f.ASID.value+'&O='+f.MATID.value,600,350);
      f.submit();
      return true;
      }
   function submitaddform3() {
      var f = document.addform;
      if(!checkNumber(f.QTY)) return false;
      f.submit();
      return true;
      }
   function submitaddform4() {
      var f = document.addform;
      if(!checkNumber(f.USEDQTY)) return false;
      f.submit();
      return true;
      }
</script>


增加: <a class="linkbut" href="l.asp?bom=1&P=teamjob&SP=add">一次輸入</a>
<a class="linkbut" href="l.asp?bom=1&P=teamjob&SP=add2">多次輸入</a>
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
      case "add2" :
        %><!--#include file="cadd2.asp" --><%
      	break;
      case "add2-1" :
        %><!--#include file="cadd2-1.asp" --><%
      	break;
      case "add2-2" :
        %><!--#include file="cadd2-2.asp" --><%
      	break;
      case "add2-3" :
        %><!--#include file="cadd2-3.asp" --><%
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
