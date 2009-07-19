<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<!--#include file="../repairlog/smslog/functions.asp" -->
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
   obj.Open("SELECT HN, PASS FROM SMSHN WHERE ID="+smshnid);
   var login   = obj.Field("HN");
   var pass    = obj.Field("PASS");

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


   var sms = Server.CreateObject("HiAir.HinetSMS");
   var result = sms.StartCon("api.hiair.hinet.net",8000,login,pass)
   if(result != 0) {
      Response.Write("<strong>Error</strong>: "+ConnectErrorToText(result));
      Stop();
      }


   var dest = String(Request("DEST"));
   var senddate = MyNow(1);
   var usingtiming = String(Request("UsingTiming"));
   if(usingtiming=="undefined") usingtiming = "0";
   if(usingtiming=="1") sms.SendDate = senddate; // also set UsingTiming = true
   var len = mess.length;
   if(advtext!='') mess = mess + " " + advtext;
   var k = dest.split(", ");
   if(k=="undefined") k = "";
   var name;
   var phone;
   var error;
   var i;
   var result = 0;

   //-----------------------
   //Bulk
   //-----------------------

   var bulk = String(Request("bulk"));
   if(bulk=="") k = "";
   else k = bulk.split("\r\n");
   name  = "";
   Response.Write("The message is "+ToSQL(mess)+"<br>");
   for(i = 0; i < k.length; i++) {
      phone = String(k[i]);
      if(k[i]=="") continue;
      Response.Write(String(i+1)+": "+phone+"... ");
      error = "";
      result = sms.SendMsg(phone,mess);
      if(result==0) { //SUCCESS
         msg_id = sms.Get_Message();
         Response.Write("OK<br>");
         obj.Execute("UPDATE BANNERS SET NBVIEW=NBVIEW+1 WHERE ID='"+advid+"'");
         }
      else {
         Response.Write("<strong>Error</strong><br>");
         error = ToSQL(SendErrorToText(result));         
         msg_id = 0;
         }
      obj.Execute("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, TYPE, ADID, ADTEXT) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+msg_id+"',"+result+","+len+","+usingtiming+",'"+senddate+"','"+type+"','"+advid+"','"+advtext+"')");
      }


   sms.EndCon();
   sms = "";
   obj = "";
%>
<br>
<a href="../l.asp?P=formatsms">Back</a>
</body>
</html>
