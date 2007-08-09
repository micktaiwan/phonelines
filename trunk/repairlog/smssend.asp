<%@ language="javascript"%>
<% Response.Buffer = true; %>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
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
      Response.Write("No SMS account defined");
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


   var sms = Server.CreateObject("MATechSMS.SMS");
   sms.Login      = login;
   sms.Password   = pass;

   var check = String(Request("CHECK"));
   var senddate = String(Request("SendDate"));
   var usingtiming = String(Request("UsingTiming"));
   if(usingtiming=="undefined") usingtiming = "0";
   if(usingtiming=="1") sms.SendDate = senddate; // also set UsingTiming = true
   var k = check.split(", ");
   if(k=="undefined") k = "";
   var id = GetSession("PHONEID");
   var len;
   var mess;
   var name;
   var phone;
   var error;
   var i;
   var result = 1;
   var repairid;
   var visitid;
   var oldi = -1;
   var personnelid;
   var newnb;

   admin = GetSession("PHONEADMIN");

   for(i = 0; i < k.length; i++) {
      if(admin == "3" && GetSession("PHONESMSLEFT") == "0") {
         Response.Write("<strong>No SMS credit left</strong>");
         obj = "";
         sms = "";
         Response.End();
         }
      if(oldi==i) {
         Response.Write("<br><strong>Problem with DB</strong><br>");
         Response.Flush();
         obj = "";
         sms = "";
         Response.End();
         }
      oldi = i;
      name  = String(Request("NAME"+k[i])).replace(/^\s+|\s+$/g,'');
      phone  = String(Request("PHONE"+k[i])).replace(/^\s+|\s+$/g,'');
      mess  = String(Request("MESS"+k[i])).replace(/^\s+|\s+$/g,'');
      len = mess.length;
      repairid = String(Request("REPAIRID"+k[i]));
      visitid  = String(Request("VISITID"+k[i]));
      personnelid  = String(Request("PERSONNELID"+k[i]));

      if(personnelid == '') Response.Write("<strong>Error : No personnal ID</strong> "+i+": "+name+" "+phone+" \"<u>" +mess+"</u>\"<br>");
      else {
         Response.Write(i+": "+name+" "+phone+" \"<u>" +mess+"</u>\"... ");
         Response.Flush();
         sms.Mess = mess;
         sms.Phone = phone;
         error = "";
         result = sms.Send();
         if(result==0) { //SUCCESS
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
            error = ToSQL(sms.Error);
            Response.Write("<strong>Problem:</strong>"+ error + "<br>");
            }
   
         obj.Execute("INSERT INTO SMS (SMSHNID, SENTDATE, MESSAGE, PHONE, NAME, MEMBERID, DELETED, ERROR, TRACKING, MSGID, RESULT, LEN, USINGTIMING, SENDDATE, REPAIRID, VISITID, PERSONNELID) VALUES ("+smshnid+",'"+MyNow(1)+"','"+ToSQL(mess)+"','"+phone+"','"+name+"',"+GetSession("PHONEID")+",0,'"+error+"',-1,'"+sms.MsgID+"',"+result+","+len+","+usingtiming+",'"+senddate+"',"+repairid+","+visitid+","+personnelid+")");
         }
      Response.Flush();
      }

   sms = "";
   obj = "";
   //Response.Redirect("../l.asp?P=sms&S=1&D#msg");
%>
<br>
OK<br>
<br>
[ <a href="../l.asp?P=repairlog&SP=smslog">簡訊記錄</a> ]
</body>
</html>
