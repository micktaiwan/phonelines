<script>
function update_online_list() {
majax.get("fetch_online_list.asp",update_online_list_display);
return false;
}
function update_online_list_display(s) {
s = unescape(s);
var l = document.getElementById("onlinelistc");
if(!l) alert("no list id found on this page\nMsg was: "+s);
else l.innerHTML = s;
}
</script>
<%
   if(IsLogged("PHONE")) {

      // Messages
      obj.ClearAll();
      obj.NewQuery("SELECT COUNT(MEMBERID) AS NB FROM MESSAGES WHERE MEMBERID='"+GetSession("PHONEID")+"' AND NEW=1");
      obj.NewTemplate(SitePath+"messages\\nb.wet");
      obj.Generate(0,0);

      // Visitors Remove and Add
      obj.ClearAll();
      obj.Execute("UPDATE VISITORS SET DATE='"+MyNow(1)+"' WHERE VISID="+id);
      obj.Execute("DELETE FROM VISITORS WHERE DATEDIFF(minute,DATE,getdate()) > 30");

      if(id!="undefined") {
         obj.NewQuery("SELECT TOP 1 ID FROM VISITORS WHERE VISID="+id);
         obj.NewTemplate(SitePath+"id.wet");
         var k2 = obj.GenerateString(0,0);

         if(k2=="") {
            sql = "INSERT INTO VISITORS (VISID, NAME, DATE, COMPANYID) VALUES ('";
            sql += id+"','"+GetSession("PHONENAME")+"','"+MyNow(1)+"', '"+company_id+"')";
            obj.EXECUTE(sql);
            }

         // Visitors Display%>
         <a href="javascript:ShowHide('onlinelist')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">線上使用者</font></a>(30m)<br>
         <div id="onlinelist" style="DISPLAY: none; Z-INDEX: 2">
         　<font size=1 color=#406893>以網頁參觀時間排列</font> <a href="#" onclick="update_online_list();">X</a><br>
         <div id="onlinelistc"></div>
			</div>
			<script>update_online_list()</script>
<%
         }
      }
      else {
%><img SRC="images/arrow03.gif" >歡迎使用本系統，請先登入<br>
<br>
<img SRC="images/arrow01.gif">Links<br>
<img SRC="images/line01.gif"><br>
<img SRC="images/arrow01.gif" ><a href="http://www.easyplay.com.tw" target="_blank">EasyPlay</a><br>
<img SRC="images/line01.gif"><br>
<img SRC="images/arrow01.gif" ><a href="http://organizer.easyplay.com.tw" target="_blank">Organizer</a><br>
<img SRC="images/line01.gif"><br>
<img SRC="images/arrow01.gif" ><a href="http://chat.easyplay.com.tw" target="_blank">Chat</a><br>
<img SRC="images/line01.gif"><br>
<br>
<%
      }
%>
