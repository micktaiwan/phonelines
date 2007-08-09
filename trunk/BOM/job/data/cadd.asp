<table>
<tr>
<td>
<form name="addform" action="bom/job/data/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>收件日期: </td><td><input type="text" name="GETDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>預定完工日: </td><td><input type="text" name="EXPECTEDDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>工程編號:</td><td>
<select name="CODE">
<%
obj.ClearAll();
obj.NewQuery("SELECT * FROM BOMDATA ORDER BY IDNUMBER");
obj.NewTemplate(SitePath+"bom\\work\\data\\option2.wet");
var c = String(Request("C"));
obj.AddVar("C="+c);
obj.Generate(0,0);
%>
</select>
</td></tr>
<tr><td>自編流水</td><td><input type="text" name="CODEB" value=""></td></tr>
<tr><td>急件</td><td><input type="text" name="DIFF" value=""></td></tr>
<tr><td>工作單編號: </td><td><input type="text" name="JOBCODE" value=""></td></tr>
<tr><td>施工地點: </td><td><input type="text" name="PLACE" value=""></td></tr>
<tr><td>退件日期: </td><td><input type="text" name="ABORTDATE" value=""></td></tr>
<tr><td>退件原因: </td><td><input type="text" name="REASON" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="增加"></td></tr>
</table>
</form>
</td>

<td>
<br>
<br>
<br>
<br>
自編流水是以﹝局別+數字﹞依序自行編號。<br>
例如三重局第一張工作單期編號如下SC001<br>
例如三重局第二張工作單期編號如下SC002<br>
</td>
</tr>
</table>
