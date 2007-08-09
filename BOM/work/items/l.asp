<script language="javascript">

   function submitaddform() {
      var f = document.addform;
      if(!checkNumber(f.PRICE)) return false;
      f.submit();
      return true;
      }
</script>


<a class="linkbut" href="l.asp?bom=1&P=items&SP=add">¼W¥[</a>
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
