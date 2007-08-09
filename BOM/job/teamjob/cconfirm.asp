<%@ language="javascript"%>
<!--#include file="../../../virtual.asp" -->
<html>
<head>
   <LINK REL=STYLESHEET HREF="../../../styles.css" TYPE="text/css">
</head>
<body bgcolor="#FFFFFF" text="black">
<div style="padding:10px;">
<center>

<table style="font-size:12pt;" border="0" cellspacing="1" cellpadding="5">
<form name="confirm">
<%
   var k = String(Request("K"));
   var l = String(Request("L"));
   var m = String(Request("M"));
   var n = String(Request("N"));
   var o = String(Request("O"));

   Session("TEAMJOBWORKID") = k;
   Session("TEAMJOBJOBID") = l;
   Session("TEAMJOBSUBJECTID") = m;
   //Session("TEAMJOBASID") = n;
   //Session("TEAMJOBMATID") = o;

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.NewQuery("SELECT ID, NAME from BOMDATA where IDNUMBER='"+k+"'");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\confirm1.wet");
   obj.NewQuery("SELECT ID, CODE, JOBCODE from BOMJOB where JOBCODE='"+l+"'");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\confirm5.wet");
   obj.NewQuery("SELECT ID, SUBJECT, POINTS from BOMITEMS where item='"+m+"'");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\confirm2.wet");
   obj.NewQuery("SELECT ID, DESCR from BOMASCODE where code='"+n+"'");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\confirm3.wet");
   obj.NewQuery("SELECT ID, NAME from BOMMATERIAL where code='"+o+"'");
   obj.NewTemplate(SitePath+"bom\\job\\teamjob\\confirm4.wet");
   obj.DirectResponse = 1;
   work  = obj.GenerateString(0,0);
   job   = obj.GenerateString(1,1);
   sub   = obj.GenerateString(2,2);
   as    = obj.GenerateString(3,3);
   mat   = obj.GenerateString(4,4);
   obj = "";
   if(work=="") Response.Write("<tr><td>工程名稱:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(work);
   if(job=="") Response.Write("<tr><td>工作單號:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(job);
   if(sub=="") Response.Write("<tr><td>工作項目:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(sub);
   if(as=="") Response.Write("<tr><td>加減點說明:</td><td><strong>錯誤</strong></td></tr><input type=\"hidden\" name=\"ASID\" value=\"\">");
   else Response.Write(as);
   if(mat=="") Response.Write("<tr><td>材料名稱:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(mat);
%>
<tr><td>&nbsp;</td><td>
<%// if(mat!="" && job!="" && sub!="" && as!="" && mat!="") { %>
<input class="linkbut" type="button" onclick="f=window.opener.document.addform; f.WORKID.value=document.confirm.WORKID.value; f.JOBID.value=document.confirm.JOBID.value; f.SUBJECTID.value=document.confirm.SUBJECTID.value; f.ASID.value=document.confirm.ASID.value; f.MATID.value=document.confirm.MATID.value; f.submit();self.close();" value="正確">
<%// } %>
<input class="linkbut" type="button" onclick="self.close();" value="取消"></td></tr>
</form>
</table>
</center>
</div>
</body>
</html>
