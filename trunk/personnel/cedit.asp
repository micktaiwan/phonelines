<%
      obj.ClearAll();
      var k = String(Request("K"));

      obj.NewQuery("SELECT * FROM personnel where id="+k);
      obj.NewTemplate(SitePath+"personnel\\edit.wet");

      obj.Generate(0,0);
%>
<form action="personnel/upload.asp" method="post" ENCTYPE="multipart/form-data">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>Photo: </td><td><input type="file" name="A" value=""></td></tr>
<tr><td>ID: </td><td><input type="file" name="B" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="Change"></td></tr>
<input type="hidden" name="K" value="<%=k%>">
</table>
</form>
