<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>�s��</td>
<td>�Z�O</td>
<td>�m�W</td>
<td>�j���j</td>
<td>�a�q��</td>
<td>¾�~�Ҹ�</td>
<td>�X�ͦ~���</td>
<td>�����Ҧr��</td>
<td>�a�}</td>
<td>��¾���</td>
<td>��¾���</td>
<td>�Ƶ�</td>
<td>�R��</td>
</tr>

<%
      var obj = Server.CreateObject("MATech.Engine");
      obj.SetDB(DB,"sa","engine");
      obj.NewQuery("SELECT * FROM personnel ORDER BY TEAM, NAME");
      obj.NewTemplate(SitePath+"personnel\\tree.wet");

      obj.Generate(0,0);
      obj = "";
%>


</table>