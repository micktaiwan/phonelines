<%
   var workid = String(Request("WORKID"));
   var jobcode  = String(Request("JOBCODE"));

   obj.ClearAll();
   obj.NewQuery("SELECT TOP 1 ID FROM BOMJOB WHERE JOBCODE='"+jobcode+"'");
   obj.NewTemplate(MMSitePath+"id.wet");
   var jobid = obj.GenerateString(0,0)*1;

%>

<%
if(0) {
   Response.Write("<div style='padding:10px;border:1px solid black;background-color:#EEEEEE;margin:20px;text-align:center;font-size:18pt;'>");
   if(workid==0) Response.Write("<strong>�u�{�s�����~</strong><br>");
   if(jobid==0) Response.Write("<strong>�u�@�渹���~</strong><br>");
   Response.Write("<a style='font-size:12pt;' href='#' onclick='history.go(-1);'>�W�@��</a></div>");
   }
else {
   if(workid!="undefined") {
      Session("TEAMJOBADD2WORKID")     = workid;
      Session("TEAMJOBADD2JOBID")      = jobid;
      Session("TEAMJOBADD2JOBCODE")    = jobcode;
      Session("TEAMJOBADD2TEAM")       = String(Request("TEAM"));
      Session("TEAMJOBADD2DATE")       = String(Request("DATE"));
      Session("TEAMJOBADD2PICTURECODE")= String(Request("PICTURECODE"));
      }

%>
<form name="addform1" action="l.asp?bom=1&P=teamjob&SP=add2-2" method="post">
<table border="0" cellspacing="1" cellpadding="2">
<tr><td>����:</td><td><input type="text" name="ITEM" value=""></td>
<td>&nbsp;</td><td><input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchooseitem.asp?ITEM='+document.addform1.ITEM.value+'&FORMNAME=addform1&FIELDNAME=ITEM','400','150');" value="�~��"></td></tr>
</form>

<tr><td>&nbsp;</td><td>��</td></tr>

<form name="addform2" action="l.asp?bom=1&P=teamjob&SP=add2-3" method="post">
<tr><td>���ƥN�X:</td><td><input type="text" name="MATCODE" value=""></td>
<td>&nbsp;</td><td><input class="button" type="button" onclick="openConfirm('bom/job/teamjob/cchoosemat.asp?MAT='+document.addform2.MATCODE.value+'&FORMNAME=addform2&FIELDNAME=MATCODE','500','150');" value="�~��"></td></tr>
</table>
</form>
<%
   }
%>
<!--#include file="ctree.asp"-->