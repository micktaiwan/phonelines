<tr bgcolor="#AABBCC" style="text-align:center;">
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>編輯</td>
<td>輸入員</td>
<%}%>
<td>日期</td>
<td>班別</td>
<td>電話號碼</td>
<!--<td>地區</td>-->
<td>結果</td>
<td>原因</td>
<td>上行</td>
<td>下行</td>
<td>備註</td>
<%if(GetSession("PHONEADMIN")!="0") {%>
<td>刪除</td>
<%}%>
</tr>
