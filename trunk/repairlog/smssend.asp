<%@ language="javascript"%>
<% Response.Buffer = true; %>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<!--#include file="smslog/functions.asp" -->
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=big5">
   <meta name="Author" content="Artemas, Mickael">
   <meta http-equiv="Keywords" content="phone, line, hinet, install, easyplay"> 
   <meta http-equiv="Description" content="Taiwan Phone Line Installation Management System"> 
   <meta http-equiv='Cache-Control' content='no-cache, must-revalidate'>
   <meta http-equiv='Pragma' content='no-cache'>
   <meta http-equiv="Page-Enter" content="blendTrans(Duration=0.5)">
   <meta http-equiv="Page-Exit" content="blendTrans(Duration=0.5)">
   <title>台灣電話線安裝管理系統</title>
   <link REL=STYLESHEET HREF="../styles.css" TYPE="text/css">
</head>
<body text="#000000" bgcolor="#FFFFFF" background="images/background.gif" topmargin="10" leftmargin="10" marginwidth="0" marginheight="0">
請少等...<br>
<br>
<%
      
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") {
      Response.Write("No permission");
      Response.End();
      }
   var smshnid = GetSession("PHONESMSHNID");
   if(smshnid == "0" || smshnid == "undefined") {
      Response.Write("沒有設定短信帳戶");
      Response.End();
      }

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   obj.ClearAll();
   obj.NewQuery("SELECT HN AS ID FROM SMSHN WHERE ID="+smshnid);
   obj.NewQuery("SELECT PASS AS ID FROM SMSHN WHERE ID="+smshnid);
   obj.NewTemplate(SitePath + "id.wet");
   var login = obj.GenerateString(0,0);
   var pass = obj.GenerateString(1,0);

   if(login == "" || pass == "") {
      obj = "";
      Response.Write("Can't get login or pass");
      Response.End();
      }


   var sms = Server.CreateObject("HiAir.HinetSMS");
   var result = sms.StartCon("api.hiair.hinet.net",8000,login,pass)
   
   if(result != 0) {
      Response.Write("<strong>Error</strong>: "+ConnectErrorToText(result));
      Stop();
      }

   var check = String(Request("CHECK"));
   var senddate = String(Request("SendDate"));
   if(senddate=="undefined") senddate = MyNow(1);
   var usingtiming = String(Request("UsingTiming"));
   if(usingtiming=="undefined") usingtiming = "0";
   // TODO if(usingtiming=="1") sms.SendDate = senddate; // also set UsingTiming = true

   var k = check.split(", ");
   if(k=="undefined") k = "";
   var id = GetSession("PHONEID");
   var len;
   var mess;
   var name;
   var phone;
   var error;
   var i;
   result = 1;
   var repairid;
   var visitid;
   var oldi = -1;
   var personnelid;
   var newnb;
   var companyid = GetSession("PHONECOMPANYID")
   var admin = GetSession("PHONEADMIN");

   for(i = 0; i < k.length; i++) {

      if(admin == "3" && GetSession("PHONESMSLEFT") == "0") {
         Response.Write("<strong>No SMS credit left</strong>");
         Stop();
         }

      if(oldi==i) {
         Response.Write("<br><strong>Problem with DB</strong><br>");
         Stop();
         }
         
      oldi     = i;
      name     = String(Request("NAME"+k[i])).replace(/^\s+|\s+$/g,'');
      phone    = String(Request("PHONE"+k[i])).replace(/^\s+|\s+$/g,'');
      mess     = String(Request("MESS"+k[i])).replace(/^\s+|\s+$/g,'');
      len      = mess.length;
      repairid = String(Request("REPAIRID"+k[i]));
      visitid  = String(Request("VISITID"+k[i]));
      personnelid  = String(Request("PERSONNELID"+k[i]));

      if(personnelid == '') Response.Write("<strong>Error : No personnal ID</strong> "+i+": "+name+" "+phone+" \"<u>" +mess+"</u>\"<br>");
      else {
         Response.Write(i+": "+name+" "+phone+" \"<u>" +mess+"</u>\"... ");
         Response.Flush();
         error = "";
         result = sms.SendMsg(phone,mess);
         if(result==0) { //SUCCESS
            msg_id = sms.Get_Message();
            //Response.Write("id="+msg_id+"<br/>");
            obj.Execute("UPDATE REPAIRLOG SET SMS=ISNULL(SMS,'0')+1 WHERE ID="+repairid);
            Response.Write("<strong>OK</strong><br>");
            if(admin=="3") {
               newnb = parseInt(GetSession("PHONESMSLEFT")) - 1;
               obj.Execute("UPDATE REPORTERS SET SMSLEFT="+newnb+" WHERE ID="+GetSession("PHONEID"));
               Session("PHONESMSLEFT") = newnb;
               //Response.Write("SMSLEFT="+newnb+"<br>");
               }
            }
         else {
            Response.Write("<strong>Send error to "+phone+":</strong> ("+ result + ") "+SendErrorToText(result) + "<br>");
            msg_id = 0;
            }
   
         //Response.Write("INSERT INTO SMS (SMSHNID, SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, REPAIRID, VISITID, PERSONNELID, COMPANYID) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+msg_id+"',"+result+","+len+","+usingtiming+",'"+senddate+"',"+repairid+","+visitid+","+personnelid+","+companyid+")");
         obj.Execute("INSERT INTO SMS (SMSHNID, SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, REPAIRID, VISITID, PERSONNELID, COMPANYID) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+msg_id+"',"+result+","+len+","+usingtiming+",'"+senddate+"',"+repairid+","+visitid+","+personnelid+","+companyid+")");
         }
      Response.Flush();
      }

   obj = "";
   sms.EndCon();
   sms = "";
   //Response.Redirect("../l.asp?P=sms&S=1&D#msg");
%>
<br>
OK<br>
<br>
[ <a href="../l.asp?P=repairlog&SP=smslog">簡訊記錄</a> ]
</body>
</html>
