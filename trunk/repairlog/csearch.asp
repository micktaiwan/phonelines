<b>�j�M</b><br>
<%
if(Request.QueryString.Count>2 || Request.Form.Count>0) {
   Session("srlREPORTDATE") = String(Request("REPORTDATE"));
   Session("srlPHONE") = String(Request("PHONE"));
   Session("srlVISITSERIAL") = String(Request("VISITSERIAL"));
   Session("srlPHONEID") = String(Request("PHONEID"));
   Session("srlBOXID") = String(Request("BOXID"));
   Session("srlREASON") = String(Request("REASON"));
   Session("srlADDRESS") = String(Request("ADDRESS"));
   Session("srlREPORTER") = String(Request("REPORTER"));
   Session("srlMEMO") = String(Request("MEMO"));
   }

var reportdate = und(GetSession("srlREPORTDATE"));
var phone = und(GetSession("srlPHONE"));
var visitserial = und(GetSession("srlVISITSERIAL"));
var phoneid = und(GetSession("srlPHONEID"));
var boxid = und(GetSession("srlBOXID"));
var reason = und(GetSession("srlREASON"));
var address = und(GetSession("srlADDRESS"));
var reporter = und(GetSession("srlREPORTER"));
var memo = und(GetSession("srlMEMO"));
%>

<form name="addform" action="l.asp?P=repairlog&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>���z���: </td><td><input type="text" name="REPORTDATE" value="<%=reportdate%>"></td></tr>
<tr><td>�q�����: </td><td><input type="text" name="REPORTER" value="<%=reporter%>"></td></tr>
<tr><td>��ê�q��: </td><td><input type="text" name="PHONE" value="<%=phone%>"></td></tr>
<tr><td>�p�渹�X: </td><td><input type="text" name="VISITSERIAL" value="<%=visitserial%>"></td></tr>
<tr><td>��u���X: </td><td><input type="text" name="PHONEID" value="<%=phoneid%>"></td></tr>
<tr><td>�p�渹�X: </td><td><input type="text" name="BOXID" value="<%=boxid%>"></td></tr>
<tr><td>��ê��]: </td><td><input type="text" name="REASON" value="<%=reason%>"></td></tr>
<tr><td>�Ȥ��}: </td><td><input type="text" name="ADDRESS" value="<%=address%>"></td></tr>
<tr><td>�Ƶ�: </td><td><textarea name="MEMO" cols="30" rows="2"><%=memo%></textarea></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="�j�M"></td></tr>
</table>

</form>

<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc"-->
<%
   var w = new Array();
   if(reportdate!="") w[2] = "REPORTDATE ='"+reportdate+"'";
   if(phone!="") w[3] = "PHONE ='"+phone+"'";
   if(phoneid!="") w[4] = "PHONEID ='"+phoneid+"'";
   if(boxid!="")   w[5] = "BOXID ='"+boxid+"'";
   if(reason!="") w[6] = "REASON ='"+reason+"'";
   if(address!="") w[7] = "ADDRESS LIKE '%"+address+"%'";
   if(reporter!="") w[8] = "REPORTER ='"+reporter+"'";
   if(memo!="") w[9] = "MEMO LIKE '%"+memo+"%'";

   var str = "";
   for(i=2; i <10; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }

   //Response.Write(str);
   if(str!="") {
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM repairlog WHERE "+str+" ORDER BY DATE DESC");
      obj.NewTemplate(SitePath+"repairlog\\tree.wet");

      obj.NewQuery("SELECT DATE AS ID FROM visits WHERE SERIAL='#'");
      obj.NewTemplate(SitePath+"id.wet");

      obj.DirectResponse = 0;
      obj.Generate(0,0);
      }
%>


</table>