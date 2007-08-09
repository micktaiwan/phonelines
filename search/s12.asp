<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>¦a°Ï</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT ZONE FROM VISITS WHERE COMPANYID='"+company_id+"' GROUP BY ZONE ORDER BY ZONE");
      obj.NewTemplate(SitePath+"search\\s12.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
      </table>
