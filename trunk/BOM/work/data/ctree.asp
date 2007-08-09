<table cellspacing="1" cellpadding="2" bgcolor="#555500" width="1700">
<tr bgcolor="#DDDDD0">
<td></td>
<td>工程編號</td>
<td>裝移機</td>
<td width="400">工程名稱: </td>
<td>主辦單位</td>
<td>Manager</td>
<td>年度</td>
<td>期數</td>
<td>Finished</td>
<td>工程期限</td>
<td>工程天數</td>
<td>承攬廠商</td>
<td>總積點數</td>
<td>積點單價</td>
<td bgcolor="#EEEEE0">工程總價</td>
<td>計價方式</td>
<td>稅別</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, NB*CAST(PRICE AS MONEY) AS NBxPRICE, DATEFROM+DAYS AS SHOULDDATE, \
         DATEDIFF(day, DATEFROM, DATETO) AS REALDAYS, ABS(DAYS - DATEDIFF(day, DATEFROM, DATETO)) AS DIF, \
         CASE WHEN GETDATE() BETWEEN DATEFROM AND DATETO THEN '1' ELSE '0' END AS ISCURRENT, \
         CASE WHEN FINISHEDDATE<=GETDATE() AND ISNULL(FINISHEDDATE,'')!='' THEN '1' ELSE '0' END AS ISFINISHED, \
         (SELECT NAME FROM REPORTERS WHERE ID=bomdata.MANAGERID) AS MANAGERNAME \
         from bomdata ORDER BY DATETO");
      obj.NewTemplate(SitePath+"bom\\work\\data\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
