<table cellspacing="1" cellpadding="2" bgcolor="#555500" width="1700">
<tr bgcolor="#DDDDD0">
<td></td>
<td>�u�{�s��</td>
<td>�˲���</td>
<td width="400">�u�{�W��: </td>
<td>�D����</td>
<td>Manager</td>
<td>�~��</td>
<td>����</td>
<td>Finished</td>
<td>�u�{����</td>
<td>�u�{�Ѽ�</td>
<td>����t��</td>
<td>�`�n�I��</td>
<td>�n�I���</td>
<td bgcolor="#EEEEE0">�u�{�`��</td>
<td>�p���覡</td>
<td>�|�O</td>
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
