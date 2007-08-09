<%
   var k = String(Request("K"));
%>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM MEMBERS WHERE ID="+k);
      obj.NewTemplate(SitePath+"messages\\name.wet");

      obj.Generate(0,0);
%>

<form action="messages/send.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>&nbsp;</td><td><textarea name="MESSAGE" rows="10" cols="60"></textarea></td></tr>
<tr><td>&nbsp;</td><td><input type="checkbox" name="email" value="1"> Send a email copy (if available)</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="<%=lex("Send")%>"></td></tr>
</table>
<input type="hidden" name="MEMBERID" value="<%=k%>">
<input type="hidden" name="SENDERID" value="<%=GetSession("ORGANID")%>">
<input type="hidden" name="DATE" value="<%=MyNow(1)%>">
</form>
