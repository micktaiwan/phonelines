<%
   obj.ClearAll();
   obj.NewTemplate(SitePath+"codename2.wet");
   if(admin!="3") {
      obj.NewQuery("SELECT * FROM zones ORDER BY CODE");
      }
   else {
      obj.NewQuery("SELECT zones.* FROM repzones JOIN zones ON repzones.ZONE=zones.ID WHERE repzones.REP="+GetSession("PHONEID")+" ORDER BY CODE");
      }
%>
<b>拆線列印</b><br>
<br>
<form name="addform" target="_blank" action="print/cpapart.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>地區: </td><td><input type="text" name="ZONE" value="">

<select onchange="addform.ZONE.value=this.value">
<option value="">== 選擇 ===</option>
<option value=""></option>
<%
      obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>工作別: </td><td><input type="text" name="JOBTYPE" value="">
<tr><td>從日期: </td><td><input type="text" name="DATEFROM" value=""> [<a href="#" onclick="addform.DATEFROM.value = MyNow(0);">今天</a>]</td></tr>
<tr><td>到日期: </td><td><input type="text" name="DATETO" value=""> [<a href="#" onclick="addform.DATETO.value = MyNow(0);">今天</a>]</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="verprintform()" value="搜尋"></td></tr>
</table>
</form>
<br>
<br>
