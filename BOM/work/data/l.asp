<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.DATEFROM.value)) {
         alert('Verify the 日期 field');
         f.DATEFROM.focus();
         return false;
         }
      if(!isValidDate(f.DATETO.value)) {
         alert('Verify the 日期 field');
         f.DATETO.focus();
         return false;
         }
      if(!checkNumber(f.YEAR)) return false;
      if(!checkNumber(f.DAYS)) return false;
      if(!checkNumber(f.NBPERIOD)) return false;
      if(!checkNumber(f.NB)) return false;
      f.submit();
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=wdata&SP=add">增加</a>
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
