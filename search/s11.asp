All different results<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>µ²ªG</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT RESULT FROM VISITS WHERE COMPANYID='"+company_id+"' GROUP BY RESULT");
      obj.NewTemplate(SitePath+"search\\s11.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
      </table>
