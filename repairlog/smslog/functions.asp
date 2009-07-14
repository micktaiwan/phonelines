<%
   function Stop() {
      obj = "";
      sms.EndCon();
      sms = "";
      Response.End();
      }

   function SendErrorToText(error) {
      switch(error) {
         case 0: return "訊息傳送成功"
         case 1: return "國別格式錯誤"
         case 2: return "編碼格式錯誤"
         case 3: return "優先權格式錯誤"
         case 4: return "Msg_content_len格式錯誤"
         case 5: return "Msg_content_len與msg_content的長度不相符"
         case 6: return "手機號碼格式"
         case 7: return "傳送型式的格式錯誤"
         case 8: return "重送截止時間格式錯誤"
         case 9: return "預約傳送時間格式錯誤"
         case 10: return "目前暫不開放傳送至國外"
         case 11: return "系統暫時無法傳送訊息"
         case 13: return "wap push的url沒有設定"
         case 14: return "wap push的訊息內容超過88個byte"
         case 16: return "簡訊內容包含連續9-10碼的電話號碼，不合規定"
         case -4: return "傳送/接收資料錯誤"
         default: return "Unknown error"
         }  
      }

   function ConnectErrorToText(error) {
      switch(error) {
         case 0: return "帳號/密碼檢查成功"
         case 1: return "密碼錯誤"
         case 2: return "帳號不存在"
         case 3: return "超過准許最大連線數"
         case -1: return "Socket 連結失敗"
         case -2: return "查server dns -> ip 錯誤"
         case -3: return "Socket初始化錯誤"
         case -4: return "Socket 傳送/接收資料錯誤"
         default: return "Unknown error"
         }  
      }
      
   function TrackMessage(id) {
      switch(id) {
         case 0: return "訊息已送達接收方"
         case 1: return "手機未開或在受訊範圍外"
         case 2: return "查詢系統無此MessageID資料"
         case 3: return "MessageID格式錯誤"
         case 4: return "已送到簡訊中心，尚未完成查詢"
         case 5: return "預約時間超過48小時"
         case -4: return "Socket 傳送/接收資料錯誤"
         default: return "Unknown error"
         }  
      }
%>
