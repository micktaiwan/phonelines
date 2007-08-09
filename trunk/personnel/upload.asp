<% @ Language="Javascript" %>
<!--#include file="../virtual.asp"-->
<!--#include file="../func.asp"-->
<%
   Server.ScriptTimeout = 60*15;
   var upobj = Server.CreateObject("Persits.Upload.1")
   var mwebmail = Server.CreateObject("MWebMail.WebMail");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
	upobj.OverwriteFiles = true;
   //upobj.SetMaxSize(10240, false);
   var dir = SitePath + "personnel\\Upload\\";
   mwebmail.CreateDirectory(dir);
   mwebmail.CreateDirectory(dir+"thumbs\\");
	var count = upobj.Save(dir);

   if(count!= 0) {
      for(i=1; i <= count; i++) {
         if(extention(upobj.Files(i).Path).toLowerCase() == "gif") {
            obj.CopyFile(SitePath+"images/gifimage.gif",dir+"thumbs\\"+upobj.Files(i).ExtractFileName());
            }
         else {
            obj.MakeThumbnail(upobj.Files(i).Path, 50,50, dir + "thumbs\\" + upobj.Files(i).ExtractFileName(), 60);
            }
         }

   	}
   else {
    	upobj = "";
      obj = "";
      mwebmail = "";
      Response.Write("No file !");
      Response.End();
      }
   var k = upobj.Form("K");


   for(i=1; i <= count; i++) {
      if(String(upobj.Files(i).Name)=="A") {
         sql = "UPDATE personnel SET PHOTO='"+upobj.Files("A").ExtractFileName()+"' WHERE ID='"+k+"'";
         obj.Execute(sql);
         }
      else if(String(upobj.Files(i).Name)=="B") {
         sql = "UPDATE personnel SET IDPHOTO='"+upobj.Files("B").ExtractFileName()+"' WHERE ID='"+k+"'";
         obj.Execute(sql);
         }
      }

   obj = "";
 	upobj = "";

/*
   mwebmail.SendHost = "202.159.185.4";
   mwebmail.MailTo = "mickael@easyplay.com.tw";
   mwebmail.MailFrom = "Organizer <mickael@easyplay.com.tw>";
   mwebmail.MailSubject = "[Organizer] Photo(s) by "+GetSession("ORGANNAME");
   //mwebmail.MailBody = body+"\n=======\n"+d;
   //mwebmail.ClearAttachments();
   mwebmail.Send();
*/
   mwebmail = "";
   //Response.Write(sql);
   Response.Redirect("../l.asp?P=personnel&SP=edit&K="+k);
%>
