<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(f.DATE && !isValidDate(f.DATE.value)) {
         alert('Verify the 日期 field');
         f.DATE.focus();
         return false;
         }
      if(!checkNumber(f.REQUESTEDNB)) return;
      if(!checkNumber(f.GIVENNB)) return;
      openConfirm('bom/material/request/cconfirm.asp?M='+f.MATERIALID.value+'&W='+f.WORKID.value,400,200);
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=request&SP=add">增加</a>
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
      case "edit" :
        %><!--#include file="cedit.asp" --><%
      	break;
      default:
%>
<br>
This page can not be found<br>
<br>
<% 	} // switch %>
