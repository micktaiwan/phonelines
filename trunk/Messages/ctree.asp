<br>
<table width="90%" cellpadding="3" cellspacing="1">
<tr style="font-weight:bold;" BGCOLOR="#B5C7DE">
<td COLSPAN="4">
<a href="javascript:ShowHide('memberlist')"><img src="images/caticon.gif" border="0"> Open</a>
�T���o�e�W��G

</td>


</table>
<div id="memberlist" style="DISPLAY: none; Z-INDEX: 2">
<table width="90%" cellpadding="3" cellspacing="1">
<tr>
<td COLSPAN="4">&nbsp;</td>
</tr>

</tr>
<tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM REPORTERS WHERE COMPANYID='"+company_id+"' ORDER BY NAME");
      obj.NewTemplate(SitePath+"messages\\people.wet");

      obj.Generate(0,0);
%>
</tr>
</table>
</div>
<br>
<br>&nbsp;
<br>
<table BGCOLOR="#000000" cellpadding="3" cellspacing="1" WIDTH="90%">
<tr style="font-weight:bold; color:#FFFFFF" BGCOLOR="#103863">
<td COLSPAN="3">���쪺�T��</td>
</tr>
<tr bgcolor="#B5C7DE">
<td WIDTH="20%"><b>�H��H</b> / ������</td>
<td WIDTH="60%"><b>�T�����e</b></td>
<td WIDTH="20%"><b>�T�����A</b></td>
</tr>
<%
      obj.ClearAll();
      var now = MyNow(1);
      obj.NewQuery("SELECT * FROM messages, reporters WHERE messages.MEMBERID='"+GetSession("PHONEID")+"' AND messages.SENDERID=reporters.ID ORDER BY messages.DATE DESC");
      obj.NewTemplate(SitePath+"messages\\tree.wet");
      obj.Generate(0,0);
      obj.Execute("UPDATE MESSAGES SET NEW='0', READDATE='"+now+"' WHERE NEW='1' AND MEMBERID="+GetSession("PHONEID"));
%>
</table>
<br>
<font color="#CC0000">
<%
   var s = String(Request("S"));
   if(s=="1") Response.Write("<strong>Your message has been sent !</strong><br>");
%>
</font>
<br>
<table BGCOLOR="#000000" cellpadding="3" cellspacing="1" WIDTH="90%">
<tr style="font-weight:bold; color:#FFFFFF" BGCOLOR="#103863">
<td COLSPAN="3">�H��ƥ�</td>
</tr>
<tr bgcolor="#B5C7DE">
<td WIDTH="20%"><b>����H</b> / �e����</td>
<td WIDTH="60%"><b>�T�����e</b></td>
<td WIDTH="20%"><b>�T�����A</b></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM messages, reporters WHERE messages.SENDERID='"+GetSession("PHONEID")+"' AND messages.MEMBERID=reporters.ID ORDER BY messages.DATE DESC");
      obj.NewTemplate(SitePath+"messages\\sent.wet");

      obj.Generate(0,0);
%>
</table>