<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!isValidDate(f.DATE.value)) {
         alert('Verify the 日期 field');
         f.DATE.focus();
         return false;
         }
      if(!checkNumber(f.REALNB)) return;
      if(!checkNumber(f.PAYNB)) return;
      openConfirm('bom/material/team/cconfirm.asp?M='+f.MATERIALID.value,400,200);
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=teammat&SP=add">增加</a>
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
