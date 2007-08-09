<table width="100%">
<tr>
<td>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>代碼</td>
<td>名稱</td>
<td>刪除</td>
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

2006年2月15日之前地區代碼

<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>代碼</td>
<td>名稱</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2</td>
<td>二包</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N</td>
<td>北二裝移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N-1</td>
<td>北二-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N2</td>
<td>北二線裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N-2</td>
<td>北二-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N21</td>
<td>北二線ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>2N22</td>
<td>北二線-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N1</td>
<td>北一裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N11</td>
<td>北一ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>3N12</td>
<td>北一拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN</td>
<td>中壢-裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-1</td>
<td>中壢-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-2</td>
<td>中壢-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>CN-5</td>
<td>整修-04-05</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1</td>
<td>東一莊移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-1</td>
<td>東一ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-2</td>
<td>東一拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E1-3</td>
<td>東一ADSL拆</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E2</td>
<td>東一整修</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>E4</td>
<td>東一整修</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc</td>
<td>新莊裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc-1</td>
<td>新莊adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>hc-2</td>
<td>新莊拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HC-5</td>
<td>新莊-MOD</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ</td>
<td>新竹-市話</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ-1</td>
<td>新竹-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HJ-2</td>
<td>新竹-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK</td>
<td>竹東-市話</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK-1</td>
<td>竹東-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HK-2</td>
<td>竹東-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT</td>
<td>文山-裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT-1</td>
<td>文山-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>HT-2</td>
<td>文山-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl</td>
<td>基隆裝移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl-1</td>
<td>基隆adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>kl-2</td>
<td>基隆拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1</td>
<td>北一線裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-1</td>
<td>北一線ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-2</td>
<td>北一線拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>N1-3</td>
<td>北一裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2</td>
<td>板二裝移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-1</td>
<td>板二-ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-2</td>
<td>板二-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>P2-4</td>
<td>板二數據</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1</td>
<td>南一線裝移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1-1</td>
<td>南一線adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s1-2</td>
<td>南一線拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2</td>
<td>南二線裝移</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2-1</td>
<td>南二線adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>s2-2</td>
<td>南二線拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SC</td>
<td>三重裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-1</td>
<td>三重adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-2</td>
<td>三重拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>sc-3</td>
<td>更模</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SC-4</td>
<td>三重數據</td>
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
<td>士林裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SL-1</td>
<td>士林adsl</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>SL-2</td>
<td>士林拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY</td>
<td>桃園裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY-1</td>
<td>桃園ADSL</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>TY-2</td>
<td>桃園-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH</td>
<td>雙和-市話裝移機</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-1</td>
<td>永和</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-2</td>
<td>永和-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-3</td>
<td>STB</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-4</td>
<td>雙和-ADSL-拆線</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YH-5</td>
<td>雙和-MOD</td>
</tr>
<tr bgcolor="#EEEEEE">
<td>YHTV</td>
<td>新視波</td>
</tr>
</table>
<%}%>
</td>
</tr>
</table>
