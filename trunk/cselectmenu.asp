<%
   if(bom!="undefined") {
      %><!--#include file="bom/cmenu.asp" --><%
      }
   else {
    switch(admin) {
      case "4" :
         %><!--#include file="cmenu4.asp" --><%
         break;
      default:
         %><!--#include file="cmenu.asp" --><%
   	   }
      } // not bom
%>
