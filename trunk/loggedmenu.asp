<!--#include file="ccommonmenu2.asp"-->
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
   if(company_id==0) {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif"><a href="l.asp?P=DBEdit"><font color="white">DBEdit</font></a>&nbsp;&nbsp;<font color="#FF5555">0.14</font> <font color="#AAAAFF"></font></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif"><a href="l.asp?P=DBEdit"><font color="white">Phones</font></a>&nbsp;&nbsp;<font color="#FF5555">0.12</font> <font color="#AAAAFF"></font></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%
      }
%>      
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=personnel"><font color="#FFCC00">¾�����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   }
%>


<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('printmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">�C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

</table>

<div id="printmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=cancel"><font color="#103863">�h��C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=dispatch"><font color="#103863">�A���C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=all"><font color="#103863">���u�C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=completed"><font color="#103863">���u�C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=sep"><font color="#103863">�j��C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=apart"><font color="#103863">��u�C�L</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a target="_blank" href="repairlog/cprint.asp"><font color="#103863">��ê�C�L</font></a></td>
</tr>

<tr>
<td BGCOLOR="#103863"><img SRC="images/line02.gif"><br><br></td>
</tr>
<%
}
%>
</table>
</div>
<%
   }
%>


<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=visits"><font color="#FFFFFF">�p������</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=visitsb"><font color="#FFFFFF">�ɳt����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%}%>

</table>
<%}%>


<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>



<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=repairlog"><font color="#FFFFFF">��ê�޲z</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
if(admin=="2" || admin=="5") {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=cases"><font color="#FFFFFF">�Ю׺޲z</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=pageviews"><font color="#FFFFFF">�������[�O��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=adv"><font color="#FFFFFF">�s�i�޲z</font></a></td>
</tr>
<!--
<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=ranks"><font color="#FFFFFF">�Z�O�ƦW</font></a></td>
</tr>
-->
<%
   } // company_id == 0
%>


<%
   } // admin = 2,5
%>

<tr>
<td HEIGHT="7" BGCOLOR="#103863" class="a90">&nbsp;<!--- Space ---></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('searchmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">�d��</font></a></td>
</tr>
</table>

<div id="searchmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >

<%
   if(company_id!=1) {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=stats"><font color="#103863">Stats</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<%
  }
%>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=8"><font color="#103863">�d�߰��D���X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=1"><font color="#103863">�d�߯Z���u���p</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=10"><font color="#103863">�Z���u�έp��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=2"><font color="#103863">�d�߬��u��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=3"><font color="#103863">�d�߯Z��ê</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=4"><font color="#103863">�d�߰h��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=5"><font color="#103863">�d�ߦA��</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=9"><font color="#103863">�d�߹j��</font></a></td>
</tr>


<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=6"><font color="#103863">�d�ߵ��u</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=7"><font color="#103863">�d�ߵ��G����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=search"><font color="#103863">�d���ث~</font></a></td>
</tr>

</table>
</div>


<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('keyinmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">����</font></a></td>
</tr>
</table>


<div id="keyinmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=cust"><font color="#103863">�Ȥ�������</font></a></td>
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
<%
   if(company_id!=1) {
%>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=give"><font color="#103863">�ث~����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>
<%
   }
%>


<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=��u"><font color="#103863">��u����</font></a></td>
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
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=�h��"><font color="#103863">�h������</font></a></td>
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
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=���P"><font color="#103863">���P����</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=�״_"><font color="#103863">�״_����</font></a></td>
</tr>

<tr>
<td HEIGHT="14" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
</div>
<%
if(admin=="5") {
%>

<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('codemenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">�N�X</font></a></td>
</tr>
</table>

<div id="codemenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=zones"><font color="#103863">�a�ϥN�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=cancel"><font color="#103863">�h��N�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=dispatch"><font color="#103863">�A���N�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=problem"><font color="#103863">��ê�N�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=kproblem"><font color="#103863">���D�ץN�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=repair"><font color="#103863">�״_�N�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=time"><font color="#103863">�ɬq�N�X</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts"><font color="#103863">�ث~�N�X</font></a></td>
</tr>

<!--
<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=staff"><font color="#103863">��J���N�X</font></a></td>
</tr>
-->

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=reporters"><font color="#103863">�q�����N�X</font></a></td>
</tr>
</table>
</div>
<%}%>
<%}%>
