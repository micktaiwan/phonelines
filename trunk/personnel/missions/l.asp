<h1>外出單</h1>
<!--<span style="background-color:#DDDDCC;">2004/08/06</span> <span style="background-color:#EEEEDD;">可以編輯了</span><br>-->
<br>
<script language="javascript">
function verify () {

   var form = document.addform;
   //if(!checkNull(form.TEAMID,"班別")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('班別錯誤');return false;}
	form.submit();
	return true;

   }
</script>
<%
if(GetSession("PHONEADMIN")!="-1") {
%>
<a class="linkbut" href="l.asp?P=personnel&SP=missions&SP2=add">輸入資料</a>
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
