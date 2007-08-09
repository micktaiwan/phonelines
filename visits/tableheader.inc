<tr bgcolor="#AABBCC" style="text-align:center;">
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>障礙</td>
<td>編輯</td>
<td>修復</td>
<td>輸入員</td>
<%}%>
<td>日期</td>
<td>班別</td>
<td>號碼</td>
<td>電話</td>
<td>地區</td>
<td>工作別</td>
<td>上下</td>
<td>結果</td>
<td>原因</td>
<td>備註</td>
<td>客戶名稱</td>
<td>地址</td>
<td>聯絡電話</td>
<td>申告人資料</td>
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>刪除</td>
<%} else {%>
<td>障礙申告</td>
<%}%>
</tr>
