<script language="javascript">

   function vercaseform() {
      
      document.casesform.submit();
      
      }

</script>


<form name="casesform" action="cases/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>�ۼо���: </td><td><input type="text" name="ORGAN" value=""> ��r</td></tr>
<tr><td>�u�{�W��: </td><td><input type="text" name="NAME" value=""> ��r</td></tr>
<tr><td>�u�{�s��: </td><td><input type="text" name="NUMBER" value=""> ��r</td></tr>
<tr><td>�}�Ф��: </td><td><input type="text" name="OPENDATE" value="<%=MyNow(3)%>"> ���</td></tr>
<tr><td>��д���: </td><td><input type="text" name="BIDLIMIT" value="<%=MyNow(0)%>"> ���</td></tr>
<tr><td>�i������: </td><td><input type="text" name="APPOINTLIMIT" value=""> ��r</td></tr>
<tr><td>����B��: </td><td><input type="text" name="DEPOSIT" value=""> ���</td></tr>
<tr><td>�г�O��: </td><td><input type="text" name="CHARGES" value=""> ���</td></tr>
<tr><td>�w����B: </td><td><input type="text" name="BUDGET" value=""> ���</td></tr>
<tr><td>�������B: </td><td><input type="text" name="BASEPRICE" value=""> ���</td></tr>
<tr><td>�л����B: </td><td><input type="text" name="PRICE" value=""> ���</td></tr>
<tr><td>�֩w�I��: </td><td><input type="text" name="UNITCOUNT" value=""> ���</td></tr>
<tr><td>�o�г��: </td><td><input type="text" name="UNIT" value=""> ���</td></tr>
<tr><td>�������: </td><td><input type="text" name="UNITBASE" value=""> ���</td></tr>
<tr><td>�o�мt��: </td><td><input type="text" name="FACTORY" value=""> ��r</td></tr>
<tr><td>���i���: </td><td><input type="text" name="ANNOUNCEDATE" value="<%=MyNow(0)%>"> ���</td></tr>
<tr><td>�U��: </td><td><input type="radio" name="DL" value="0" checked> �_ <input type="radio" name="DL" value="1"> �O</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="vercaseform();" value="�W�["></td></tr>
</table>
</form>
<%
var e = String(Request("E"));
if(e=="1") Response.Write("<strong>OK</strong><br>");
%>
�̫᪺���:<br>
<table width="90%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="#B5C7DE">
<td>�s��</td>
<td>�U��</td>
<td>�ۼо���</td>
<td>�u�{�s��</td>
<td>�u�{�W��</td>
<td>��д���</td>
<td>���</td>
<td>�г�O��</td>
<td>�}�Ф��</td>
<td>�i������</td>
<td>�w����B</td>
<td>���i</td>
</tr><%
   obj.ClearAll();
   obj.NewQuery("SELECT TOP 10 * FROM CASES ORDER BY INSERTDATE DESC");
   obj.NewTemplate(SitePath+"cases/tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>
</table>