<%
if(admin!="4") {
%>

<img src="images/visits.gif"><br>
<br>
<div style="margin: 0px;border: 1px solid #AAAAA0; background-color : #EEEEE0;padding:10px;">
<form name="addform" action="l.asp?P=visits&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="6">
<tr>
<td class="a90">�H�p�渹�X�d�ߡG<input type="text" name="SERIAL" value="" class="a90" style="height:14pt">�@�аȥ���J���T���X</td>
</tr>

<tr>
<td class="a90">�H�q�ܸ��X�d�ߡG<input type="text" name="PHONE" value="" class="a90" style="height:14pt">�@�аȥ���J���T���X ( ������J�ϽX )<br>
�M�u���X�n�d�y�A�ݡz�����b���X��[�y-�z�C�ҡG225G15427-</td>
</tr>

<tr>
<td class="a90"><input class="button" type="submit" value=" �j�@�M " class="a90" style="height:14pt"></td>
</tr>
</table>
</form>
<font size="2">
<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT COUNT (ID) AS C FROM VISITS");
   obj.NewTemplate(SitePath+"stats1.wet");
   obj.Generate(0,0);
   obj.NewQuery("SELECT COUNT (ID) AS C FROM REPAIRLOG");
   obj.NewTemplate(SitePath+"stats2.wet");
   obj.Generate(1,1);
%>
</font>
</div>
<br>
<%}%>
<img src="info/lastnews.gif"><br>
<br>
<!-- include file="info/clast.asp"-->
<!--#include file="info/l.asp"-->
