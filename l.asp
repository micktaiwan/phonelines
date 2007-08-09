<%@ language="javascript"%>
<!--#include file="init.asp"-->
<!--#include file="func.asp"-->
<!--#include file="virtual.asp"-->
<%
   //if(String(Session("AUTOLOGINUSED")) == "undefined")
   //   Response.Redirect("autologin.asp");
   if(String(Session("PHONEID")) == "undefined")
      Response.Redirect("clogin.asp");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   var id2 = id; if(id2=="undefined") id2 = 0;
   //if(ip!="61.222.7.184")
   obj.EXECUTE("INSERT INTO PAGEVIEWS (DATE, MEMBERID, PAGE,IP) VALUES ('"+MyNow(1)+"',"+id2+",'"+qs+"','"+ip+"')");
%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<!--#include file="chead.asp"-->
<body text="#000000" bgcolor="#FFFFFF" background="images/background.gif" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<% 
//Response.Write("Company: "+ company_id)
%>
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" HEIGHT="100%" >
<!--#include file="ctitle.asp"-->
<tr>
<td VALIGN=TOP HEIGHT="90%"><!--- Page --->

<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>

<td class="noprint" VALIGN=TOP WIDTH="1%" BGCOLOR="#DEEBF7">
<!--#include file="cselectmenu.asp"-->
</td>

<td ALIGN=CENTER VALIGN=TOP>
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="96%" >
<tr>
<td>
<%if(IsLogged("PHONE")) {%>
   <!-- include file="cbanner.asp" -->
<%    if(bom=="undefined") {%> <!--#include file="cselectpage.asp"--><% }
      else {%>      <!--#include file="bom/cselectpage.asp"--><%} // bom
   } // logged
%>
</td>
</tr>

<tr>
<td HEIGHT="21"><!--- Space ---></td>
</tr>
</table>

</td></tr>
</table>

</td></tr>

<tr>
<td class="noprint" HEIGHT="21" BACKGROUND="images/background_end.gif" class="a90"><img SRC="images/arrowX.gif" >
<%   if(company_id==0) { %>
宇展科技網路股份有限公司
<%   } else if(company_id==1) {%>
	
	
<% }%>
</td></tr>
</table>

</body>
</html>
<%   obj = ""; %>
