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
   <title>�x�W�q�ܽu�w�˺޲z�t��</title>
   <link REL=STYLESHEET HREF="../../styles.css" TYPE="text/css">
</head>
<body text="#000000" bgcolor="#FFFFFF" background="images/background.gif" topmargin="10" leftmargin="10" marginwidth="0" marginheight="0">
�Фֵ�...<br>
<br>
<%
   if(!IsLogged("PHONE")) Response.End();
   Server.ScriptTimeout = 60*15;

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var sms = Server.CreateObject("MATechSMS.SMS");

   var id = GetSession("PHONEID");

   obj.NewQuery("SELECT ID FROM SMS WHERE MEMBERID='"+id+"' AND RESULT=0 AND DELETED=0 AND TRACKING!=10 ORDER BY ID DESC");
   obj.NewTemplate(SitePath+"repairlog\\smslog\\trackid.wet");
   var k = obj.GenerateString(0,0);

   k = k.split(",");

   var i;
   Response.Write((k.length-1)+" records... Please wait...<br>");
   Response.Flush();
   for(i=0; i < k.length; i++) {

      if(k[i]=="" || k[i]=="undefined") continue;

      Response.Write("Record "+(i+1)+" - ");
      Response.Flush();

      obj.ClearAll();
      obj.NewQuery("SELECT smshnid AS ID FROM SMS WHERE ID="+k[i]);
      obj.NewQuery("SELECT PHONE AS ID FROM SMS WHERE ID="+k[i]);
      obj.NewQuery("SELECT msgid AS ID FROM SMS WHERE ID="+k[i]);
      obj.NewQuery("SELECT TYPE AS ID FROM SMS WHERE ID="+k[i]);
      obj.NewTemplate(SitePath+"id.wet");

      var type = obj.GenerateString(3,0);
      var smshnid;
      if(type=="1") {
         smshnid = obj.GenerateString(0,0);
         }
      else {
         smshnid = -1;
            }
      var phone   = obj.GenerateString(1,0);
      var msgid   = obj.GenerateString(2,0);


      if(smshnid == "") {
         obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(),TRACKMSG='Can't get smshnid' WHERE ID="+k[i]);
         continue;
         }
      if(smshnid == "0") {
         obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(),TRACKMSG='Incompatible record' WHERE ID="+k[i]);
         continue;
         }

      if(type=="0") {
         obj.ClearAll();
         obj.NewQuery("SELECT HN AS ID FROM SMSHN WHERE ID="+smshnid);
         obj.NewQuery("SELECT PASS AS ID FROM SMSHN WHERE ID="+smshnid);
         obj.NewTemplate(SitePath + "id.wet");
         var login = obj.GenerateString(0,0);
         var pass = obj.GenerateString(1,0);
         if(login == "" || pass == "") {
            obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(),TRACKMSG='Can not get login or password' WHERE ID="+k[i]);
            continue;
            }
         }
      else {
         login = "84542930";
         pass  = "2agirrdl";
         }

      sms.Login      = login;
      sms.Password   = pass;

      result = sms.Track(phone,msgid);
      if(result==0) { //SUCCESS
         obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(), tracking="+sms.RetCode+",TRACKMSG='"+sms.RetDescription+"' WHERE ID="+k[i]);
         }
      else {
         obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(), tracking=-1,TRACKMSG='"+sms.RetDescription+"' WHERE ID="+k[i]);
         }
      }

   sms = "";
   obj = "";
%>
<br>
OK<br>
<br>
[ <a href="../l.asp?P=sms&D#msg">²�T</a> ]
</body>
</html>
