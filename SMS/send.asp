<%@ language="javascript"%>
<!--#include file="../init.asp" -->
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<!--#include file="../trim.asp" -->
<!--#include file="../repairlog/smslog/functions.asp" -->
<%
   String.prototype.Trim  = new Function("return this.replace(/^\\s+|\\s+$/g,'')")
   var smshnid = GetSession("PHONESMSHNID");
   //Response.Write(smshnid);
   //Response.End();
   var type = String(Request("TYPE"));
   var id = GetSession("PHONEID");
   if(id == "undefined") {
      Response.End();
      }

   if(type=="0" && (smshnid == "0" || smshnid == "undefined")) {
      Response.Write("No SMS account defined");
      Response.End();
      }
   if(type=="1" && smshnid!="10") smshnid = -1;

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var advid   = "-1";
   var advtext = "";
   if(type=="0" || smshnid=="10") {
      obj.ClearAll();
      obj.Open("SELECT HN, PASS FROM SMSHN WHERE ID="+smshnid);
      var login = obj.Field("HN");
      var pass = obj.Field("PASS");

      if(login == "" || pass == "") {
         obj = "";
         Response.Write("Can't get login or pass. smshnid="+smshnid);
         Response.End();
         }
      }
   else {
      login = "73305139";
      pass  = "92f0d6ba";
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
   var senddate = String(Request("SendDate"));
   if(senddate=="undefined") senddate = MyNow(1);
   var usingtiming = String(Request("UsingTiming"));
   if(usingtiming=="undefined") usingtiming = "0";
   //if(usingtiming=="1") sms.SendDate = senddate; // also set UsingTiming = true
   var mess = String(Request("MESS")).Trim();
   var len = mess.length;
   mess = mess + " " + advtext;
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
   //Checkboxes
   //-----------------------

   for(i = 0; i < k.length; i+=2) {
      if(type=="0" && GetSession("PHONESMSLEFT")=="0") {
         sms = "";
         obj = "";
         Response.Redirect("../l.asp?P=sms&S=2");
         }
      if(type=="1" && smshnid!="10") {
         // get how many SMS he send in the last 24h
         obj.ClearAll();
         obj.NewQuery("SELECT COUNT(*) AS ID FROM SMS WHERE MEMBERID='"+id+"' AND TYPE=1 AND RESULT=0 AND TRACKING!=21 AND TRACKING!=13 AND SENTDATE>GETDATE()-1");
         obj.NewTemplate(MMSitePath+"id.wet");
         last24 = obj.GenerateString(0,0)*1;
         if(last24>=5) {
            sms = "";
            obj = "";
            Response.Redirect("../l.asp?P=sms&S=2");
            }
         }
      name  = String(k[i]).Trim();
      phone = String(k[i+1]).Trim();

//    Response.Write(phone.length+"<br>");
//    Response.Write(phone+"<br>");
//    obj = "";
//    sms = "";
//    Response.End();

      //sms.Phone = phone;
      error = "";
      //result = sms.Send();
      result = sms.SendMsg(phone,mess);
      if(result==0) { //SUCCESS
         msg_id = sms.Get_Message();
         if(type=="0") {
            obj.Execute("UPDATE REPORTERS SET smsleft=smsleft-1, totalsms=totalsms+1 WHERE ID="+id);
            Session("PHONESMSLEFT") = parseInt(GetSession("PHONESMSLEFT"))-1;
            Session("PHONETOTALSMS") = parseInt(GetSession("PHONETOTALSMS"))+1;
            }
         else {
            obj.Execute("UPDATE BANNERS SET NBVIEW=NBVIEW+1 WHERE ID='"+advid+"'");
            }
         }
      else {
         error = ToSQL(SendErrorToText(result));
         msg_id = 0
         }
      //Response.Write("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE) VALUES ("+smshnid+",'"+MyNow(1)+"','"+mess+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+sms.MsgID+"',"+result+","+len+","+usingtiming+",'"+senddate+"')");
      obj.Execute("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, TYPE, ADID, ADTEXT,COMPANYID) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+msg_id+"',"+result+","+len+","+usingtiming+",'"+senddate+"','"+type+"','"+advid+"','"+advtext+"','"+company_id+"')");
      }

   //-----------------------
   //Bulk
   //-----------------------

   var bulk = String(Request("bulk")).Trim();
   if(bulk=="") k = "";
   else k = bulk.split("\r\n");
   name  = "";

   for(i = 0; i < k.length; i++) {
      if(type=="0" && GetSession("PHONESMSLEFT")=="0") {
         sms = "";
         obj = "";
         Response.Redirect("../l.asp?P=sms&S=2");
         }
      if(type=="1" && smshnid!="10") {
         // get how many SMS he send in the last 24h
         obj.ClearAll();
         obj.NewQuery("SELECT COUNT(*) AS ID FROM SMS WHERE MEMBERID='"+id+"' AND TYPE=1 AND RESULT=0 AND TRACKING!=21 AND TRACKING!=13 AND SENTDATE>GETDATE()-1");
         obj.NewTemplate(MMSitePath+"id.wet");
         last24 = obj.GenerateString(0,0)*1;
         if(last24>=5) {
            sms = "";
            obj = "";
            Response.Redirect("../l.asp?P=sms&S=2");
            }
         }
      phone = String(k[i]).Trim();

//    Response.Write(phone.length+"<br>");
//    Response.Write(phone+"<br>");
//    obj = "";
//    sms = "";
//    Response.End();

      //sms.Phone = phone;
      error = "";
      // result = sms.Send();
      result = sms.SendMsg(phone,mess);
      if(result==0) { //SUCCESS
         msg_id = sms.Get_Message();
         if(type=="0") {
            obj.Execute("UPDATE REPORTERS SET smsleft=smsleft-1, totalsms=totalsms+1 WHERE ID="+id);
            Session("PHONESMSLEFT") = parseInt(GetSession("PHONESMSLEFT"))-1;
            Session("PHONETOTALSMS") = parseInt(GetSession("PHONETOTALSMS"))+1;
            }
         else {
            obj.Execute("UPDATE BANNERS SET NBVIEW=NBVIEW+1 WHERE ID='"+advid+"'");
            }
         }
      else {
         error = ToSQL(SendErrorToText(result));
         msg_id = 0
         }
      //Response.Write("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE) VALUES ("+smshnid+",'"+MyNow(1)+"','"+mess+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+sms.MsgID+"',"+result+","+len+","+usingtiming+",'"+senddate+"')");
      obj.Execute("INSERT INTO SMS (SMSHNID,SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, TYPE, ADID, ADTEXT, COMPANYID) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+msg_id+"',"+result+","+len+","+usingtiming+",'"+senddate+"','"+type+"','"+advid+"','"+advtext+"','"+company_id+"')");
      }


   sms.EndCon();
   sms = "";
   obj = "";
   Response.Redirect("../l.asp?P=sms&S=1&D#msg");
%>
