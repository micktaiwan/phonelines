<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow03.gif" ><a href="logout.asp">�n�X���t��</a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp"><font color="#FFCC00">�^�쭺��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp?P=epi"><font color="#FFCC00">���ӤH�K�X</font></a></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp?P=cal"><font color="#FFCC00">��ƾ�</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<% if(canseebom) { %>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1"><font color="#FFFFFF">�u�{�޲z</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<% } %>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=information"><font color="#FFFFFF">���i��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=messages"><font color="#FFFFFF">�H���ǰe����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=contacts"><font color="#FFFFFF">�q�T��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%
   }
%>

<% if (admin!="3" && admin!="4") { %>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=sms"><font color="#FFFFFF">²�T</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<% } %>


</table>
