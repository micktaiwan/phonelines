<!--- Menu --->
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td><img SRC="images/bk_menu.gif"></td>
</tr>

<tr>
<td VALIGN=TOP HEIGHT="30" BGCOLOR="#103863" class="A">
<!--#include file="ccommonmenu.asp"-->
</td>
</tr>


<tr>
<td HEIGHT="7" BGCOLOR="#103863" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
<%
if(IsLogged("PHONE")) {
%>
<!--#include file="ccommonmenu2.asp"-->

<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=repairlog"><font color="#FFFFFF">��ê�޲z</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=formatsms"><font color="#FFFFFF">SMS</font></a></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=1"><font color="#103863">�d�߯Z���u���p</font></a></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visitsb"><font color="#103863">�ɳt����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=���u"><font color="#103863">���u����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=�h��"><font color="#103863">�h������</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=��u"><font color="#103863">��u����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=�A��"><font color="#103863">�A������</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=�j��"><font color="#103863">�j������</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=give"><font color="#103863">�ث~����</font></a> / <a href="l.asp?P=gifts&SP=search"><font color="#103863">�ث~�d��</font></a></td>
</tr>


<% } //logged %>

<tr>
<td HEIGHT="30" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
