<h1>�~�X��</h1>
<!--<span style="background-color:#DDDDCC;">2004/08/06</span> <span style="background-color:#EEEEDD;">�i�H�s��F</span><br>-->
<br>
<script language="javascript">
function verify () {

   var form = document.addform;
   //if(!checkNull(form.TEAMID,"�Z�O")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}
	form.submit();
	return true;

   }
</script>
<%
if(GetSession("PHONEADMIN")!="-1") {
%>
<a class="linkbut" href="l.asp?P=personnel&SP=missions&SP2=add">��J���</a>
<br>
<br>
<%
    switch(sp2.toLowerCase()) {
      case "" :
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
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>

<%
	}
	else {
%>
<br>
<br>
<br>
<br>
<center>
No permission
</center>
<%
	}
%>
