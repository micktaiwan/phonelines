To: <%
   var k = String(Request("K"));
%>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM REPORTERS WHERE ID="+k);
      obj.NewTemplate(SitePath+"messages\\name.wet");

      obj.Generate(0,0);
%>

<form action="messages/send.asp" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>&nbsp;</td><td><textarea name="MESSAGE" rows="10" cols="60"></textarea></td></tr>
<!--<tr><td>&nbsp;</td><td><input type="checkbox" name="email" value="1"> Send a email copy (if available)</td></tr>-->
<tr><td>&nbsp;</td><td class="a90"><input class="button" type="submit" value=" Send " class="a90" style="height:14pt"></td></tr>
</table>
<input type="hidden" name="MEMBERID" value="<%=k%>">
<input type="hidden" name="SENDERID" value="<%=GetSession("PHONEID")%>">
<input type="hidden" name="DATE" value="<%=MyNow(1)%>">
</form>
