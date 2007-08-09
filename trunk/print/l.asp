<img src="images/printer.jpg" align="right">
<%
if(GetSession("PHONEADMIN")!="0") {
%>
[ <a href="l.asp?P=print&SP=cancel">退件列印</a> ]
[ <a href="l.asp?P=print&SP=dispatch">再派列印</a> ]
[ <a href="l.asp?P=print&SP=all">派工列印</a> ]
[ <a href="l.asp?P=print&SP=completed">竣工列印</a> ]
[ <a href="l.asp?P=print&SP=apart">拆線列印</a> ]
[ <a href="l.asp?P=print&SP=sep">隔日列印</a> ]
<br>
<%}%>
<br>
<script language="javascript">

   function verprintform() {
      
      var f = document.addform;
      if(f.DATETO.value=='' || f.DATEFROM.value=='')
         alert('少了日期');
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

