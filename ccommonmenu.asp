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
         　<font size=1 color=#406893>以網頁參觀時間排列</font><br><%
         obj.ClearAll();
         obj.NewQuery("SELECT VISID, NAME, DATEDIFF(minute,DATE,getdate()) AS M, DATEDIFF(second,DATE,getdate()) AS S FROM VISITORS WHERE COMPANYID='"+company_id+"' ORDER BY DATE DESC");
         obj.NewTemplate(SitePath+"visitors.wet");
         obj.Generate(0,0);%>
         </div><%
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
