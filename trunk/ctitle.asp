<!--- Title --->
<%
   if(company_id==0) {
%>
<tr>
<td VALIGN=TOP HEIGHT="10%">
<table class="noprint" BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td ROWSPAN="2" WIDTH="1%"><img SRC="images/image01.jpg"></td>
<td BGCOLOR="#849EBD"><img SRC="images/pl_en.gif"></td>
<td ALIGN=CENTER HEIGHT="18%" BGCOLOR="#B5C7DE" class="A">&nbsp;</font></td>
</tr>

<tr>
<td BGCOLOR="#D6D3D6" width="70%"><img SRC="images/pl_logo.gif" ></td>
<td ALIGN=CENTER WIDTH="200" BGCOLOR="#EAEAEA"><a href="http://www.easyplay.com.tw" target="_blank"><img SRC="images/ep_logo.gif" BORDER=0></a></td>
</tr>
<%
if(IsLogged("PHONE")) {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow00.gif" ><%=MyNow(1)%></td>
<td colspan="2" BGCOLOR="#FFFFFF">&nbsp;<font color="#AAAAAA">如果您發現網站問題請打電話給宇展科技<img src="images/phoneicon.gif">8295 7189</font></td>
<!--<td colspan="2" bgcolor="FFFF00" style="font-size:12pt;">&nbsp;<b>2003/04/08 09:10AM : 要重開機 !!! 請等5分鐘...</b></td>-->
</tr>
<%
   }
else {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow00.gif" ><%=MyNow(1)%></td>
<td><!--- Space ---></td>
<td><!--- Space ---></td>
</tr>
<%
   }
%>
</table>

<!--- Title --->
</td>
</tr>
<%
   }
%>
