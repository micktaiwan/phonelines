<table width="100%">
<tr>
<td>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�N�X</td>
<td>�W��</td>
<td>�R��</td>
</tr>

<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM zones WHERE companyid='"+company_id+"' ORDER BY CODE");
      obj.NewTemplate(SitePath+"zones\\tree.wet");

      obj.Generate(0,0);
%>
</table>
</td>
<td>
<%
   if(company_id=='0') {
%>

2006�~2��15�餧�e�a�ϥN�X

<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>�N�X</td>
<td>�W��</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2</td>
<td>�G�]</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N</td>
<td>�_�G�˲�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N-1</td>
<td>�_�G-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N2</td>
<td>�_�G�u�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N-2</td>
<td>�_�G-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N21</td>
<td>�_�G�uADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N22</td>
<td>�_�G�u-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N1</td>
<td>�_�@�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N11</td>
<td>�_�@ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N12</td>
<td>�_�@��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN</td>
<td>���c-�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-1</td>
<td>���c-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-2</td>
<td>���c-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-5</td>
<td>���-04-05</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1</td>
<td>�F�@����</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-1</td>
<td>�F�@ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-2</td>
<td>�F�@��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-3</td>
<td>�F�@ADSL��</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E2</td>
<td>�F�@���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E4</td>
<td>�F�@���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc</td>
<td>�s���˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc-1</td>
<td>�s��adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc-2</td>
<td>�s����u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HC-5</td>
<td>�s��-MOD</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ</td>
<td>�s��-����</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ-1</td>
<td>�s��-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ-2</td>
<td>�s��-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK</td>
<td>�˪F-����</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK-1</td>
<td>�˪F-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK-2</td>
<td>�˪F-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT</td>
<td>��s-�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT-1</td>
<td>��s-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT-2</td>
<td>��s-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl</td>
<td>�򶩸˲�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl-1</td>
<td>��adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl-2</td>
<td>�򶩩�u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1</td>
<td>�_�@�u�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-1</td>
<td>�_�@�uADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-2</td>
<td>�_�@�u��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-3</td>
<td>�_�@�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2</td>
<td>�O�G�˲�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-1</td>
<td>�O�G-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-2</td>
<td>�O�G-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-4</td>
<td>�O�G�ƾ�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1</td>
<td>�n�@�u�˲�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1-1</td>
<td>�n�@�uadsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1-2</td>
<td>�n�@�u��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2</td>
<td>�n�G�u�˲�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2-1</td>
<td>�n�G�uadsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2-2</td>
<td>�n�G�u��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SC</td>
<td>�T���˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-1</td>
<td>�T��adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-2</td>
<td>�T����u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-3</td>
<td>���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SC-4</td>
<td>�T���ƾ�</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-5</td>
<td>MOD</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SJ1</td>
<td>ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SL</td>
<td>�h�L�˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SL-1</td>
<td>�h�Ladsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SL-2</td>
<td>�h�L��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY</td>
<td>���˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY-1</td>
<td>���ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY-2</td>
<td>���-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH</td>
<td>���M-���ܸ˲���</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-1</td>
<td>�éM</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-2</td>
<td>�éM-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-3</td>
<td>STB</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-4</td>
<td>���M-ADSL-��u</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-5</td>
<td>���M-MOD</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YHTV</td>
<td>�s���i</td>
</tr>
</table>
<%}%>
</td>
</tr>
</table>
