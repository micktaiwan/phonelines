<table>
<tr>
<td>
<form name="addform" action="bom/job/data/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>������: </td><td><input type="text" name="GETDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>�w�w���u��: </td><td><input type="text" name="EXPECTEDDATE" value="<%=MyNow(0)%>"></td></tr>
<tr><td>�u�{�s��:</td><td>
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
<tr><td>�۽s�y��</td><td><input type="text" name="CODEB" value=""></td></tr>
<tr><td>���</td><td><input type="text" name="DIFF" value=""></td></tr>
<tr><td>�u�@��s��: </td><td><input type="text" name="JOBCODE" value=""></td></tr>
<tr><td>�I�u�a�I: </td><td><input type="text" name="PLACE" value=""></td></tr>
<tr><td>�h����: </td><td><input type="text" name="ABORTDATE" value=""></td></tr>
<tr><td>�h���]: </td><td><input type="text" name="REASON" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform();" value="�W�["></td></tr>
</table>
</form>
</td>

<td>
<br>
<br>
<br>
<br>
�۽s�y���O�H�����O+�Ʀr���̧Ǧۦ�s���C<br>
�Ҧp�T�����Ĥ@�i�u�@����s���p�USC001<br>
�Ҧp�T�����ĤG�i�u�@����s���p�USC002<br>
</td>
</tr>
</table>
