<img src="images/printer.jpg" align="right">
<%
if(GetSession("PHONEADMIN")!="0") {
%>
[ <a href="l.asp?P=print&SP=cancel">�h��C�L</a> ]
[ <a href="l.asp?P=print&SP=dispatch">�A���C�L</a> ]
[ <a href="l.asp?P=print&SP=all">���u�C�L</a> ]
[ <a href="l.asp?P=print&SP=completed">���u�C�L</a> ]
[ <a href="l.asp?P=print&SP=apart">��u�C�L</a> ]
[ <a href="l.asp?P=print&SP=sep">�j��C�L</a> ]
<br>
<%}%>
<br>
<script language="javascript">

   function verprintform() {
      
      var f = document.addform;
      if(f.DATETO.value=='' || f.DATEFROM.value=='')
         alert('�֤F���');
      else f.submit();
      
      }
      
</script>

<%
    switch(sp.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %>Please choose a option<%
         break;
      case "dispatch" :
       	 %><!--#include file="cpsearchdispatch.asp" --><%
         break;
      case "cancel" :
       	 %><!--#include file="cpsearchcancel.asp" --><%
         break;
      case "completed" :
       	 %><!--#include file="cpsearchcompleted.asp" --><%
         break;
      case "all" :
       	 %><!--#include file="cpsearchall.asp" --><%
         break;
      case "sep" :
       	 %><!--#include file="cpsearchsep.asp" --><%
         break;
      case "apart" :
       	 %><!--#include file="cpsearchapart.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>	

