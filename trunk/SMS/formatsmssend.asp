<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=big5">
   <meta name="Author" content="Artemas (Art Design), Mickael mickael@easyplay.com.tw (Programmation)">
   <meta http-equiv="Keywords" content="phone, line, hinet, install, easyplay">
   <meta http-equiv="Description" content="Taiwan Phone Line Installation Management System">
   <meta http-equiv='Cache-Control' content='no-cache, must-revalidate'>
   <meta http-equiv='Pragma' content='no-cache'>
   <title>台灣電話線安裝管理系統</title>
   <link REL=STYLESHEET HREF="../styles.css" TYPE="text/css">
</head>
<body text="#000000" bgcolor="#FFFFFF" background="images/background.gif" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<%
   var mess = String(Request("MESS"));
   var smshnid = GetSession("PHONESMSHNID");
   //Response.Write(smshnid);
   //Response.End();
   var type = 1; // free
   var id = GetSession("PHONEID");
   if(id == "undefined") {
      Response.Write("Phone ID undefined");
      Response.End();
      }

   if(type=="0" && (smshnid == "0" || smshnid == "undefined")) {
      Response.Write("No SMS account defined");
      Response.End();
      }

   //if(type=="1" && smshnid!="10") smshnid = -1;

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var advid   = "-1";
   var advtext = "";

   obj.ClearAll();
   obj.NewQuery("SELECT HN AS ID FROM SMSHN WHERE ID="+smshnid);
   obj.NewQuery("SELECT PASS AS ID FROM SMSHN WHERE ID="+smshnid);
   obj.NewTemplate(SitePath + "id.wet");
   var login = obj.GenerateString(0,0);
   var pass = obj.GenerateString(1,0);

   if(login == "" || pass == "") {
      obj = "";
      Response.Write("Can't get login or pass. <strong>smshnid="+smshnid+"</strong><br>");
	   Response.Write("尚未設定簡訊帳號");
      Response.End();
      }

   if(type=="1") {
      // Free: add ad
      obj.ClearAll();
      obj.NewQuery("SELECT TOP 1 ID,TEXT FROM BANNERS WHERE TYPE=1 AND DISABLED=0 AND (MAXVIEW=0 OR NBVIEW<MAXVIEW) AND DATEDIFF(day,GETDATE(),FROMDATE) <= 0 AND (TIMELIMIT=0 OR DATEDIFF(day,GETDATE(),TODATE) >= 0) ORDER BY NEWID()");
      obj.NewTemplate(SitePath+"adv\\id_text.wet");
      adv = obj.GenerateString(0,0).split("\\**\\");
      if(adv=="") { // no ad available
         sms = "";
         obj = "";
         Response.Write("no more ad")
         Response.Redirect("../l.asp?P=sms&S=3#send"); // no ad
         }
      advid    = adv[0];
      advtext  = adv[1];
      }


   var sms = Server.CreateObject("MATechSMS.SMS");
   sms.Login = login;
   sms.Password = pass;

   var dest = String(Request("DEST"));
   var senddate = MyNow(1);
   var usingtiming = String(Request("UsingTiming"));
   if(usingtiming=="undefined") usingtiming = "0";
   if(usingtiming=="1") sms.SendDate = senddate; // also set UsingTiming = true
   var len = mess.length;
   sms.Mess = mess + " " + advtext;
   //Response.Write(DEST+"<br>");
   var k = dest.split(", ");
   if(k=="undefined") k = "";
   var name;
   var phone;
   var error;
   var i;
   //Response.Write(k.length+"<br>");
   var result = 0;

   //-----------------------
   //Bulk
   //-----------------------

   var bulk = String(Request("bulk"));
   //Response.Write("bulk == "+bulk+"<br>");
   if(bulk=="") k = "";
   else k = bulk.split("\r\n");
   name  = "";
   //Response.Write("There are "+k.length+" phone numbers.<br>");
   Response.Write("The message is "+ToSQL(mess)+"<br>");
   for(i = 0; i < k.length; i++) {
      phone = String(k[i]);
      if(k[i]=="") continue;
      Response.Write(String(i+1)+": "+phone+"... ");
/*
      obj = "";
      sms = "";
      Response.End();
*/

      sms.Phone = phone;
      error = "";
      result = sms.Send();
      if(result==0) { //SUCCESS
         Response.Write("OK<br>");
         obj.Execute("UPDATE BANNERS SET NBVIEW=NBVIEW+1 WHERE ID='"+advid+"'");
         }
      else {
         Response.Write("<strong>Error</strong><br>");
         error = ToSQL(sms.Error);
         }
      //Response.Write("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, TYPE, ADID, ADTEXT) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+sms.MsgID+"',"+result+","+len+","+usingtiming+",'"+senddate+"','"+type+"','"+advid+"','"+advtext+"')");
      obj.Execute("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, TYPE, ADID, ADTEXT) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+sms.MsgID+"',"+result+","+len+","+usingtiming+",'"+senddate+"','"+type+"','"+advid+"','"+advtext+"')");
      }


   sms = "";
   obj = "";
   //Response.Redirect("../l.asp?P=sms&S=1&D#msg");
%>
<br>
<a href="../l.asp?P=formatsms">Back</a>
</body>
</html>
