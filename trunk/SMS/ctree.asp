
<SCRIPT language="JavaScript">

function selectgroup(name, selectname) {

   var f = document.sms;
   for(i=0; i < f.elements.length ; i++) {

      obj = f.elements[i];
      if(selectname.value == -1) {
         if (obj.style) obj = obj.style;
         obj.visibility = 'visible';
         continue;
         }

      var id = String(f.elements[i].id);
      if(id=="") continue;
      if(id.substring(0,name.length)!=name) continue;
      groupid = id.split("-")[1];
      if(groupid == selectname.value) {
         obj.checked = true;
         if (obj.style) obj = obj.style;
         obj.visibility = 'visible';
         }
      else {
         obj.checked = false;
         if (obj.style) obj = obj.style;
         obj.visibility = 'hidden';
         }
      }

   }

</SCRIPT>



<form name="sms" action="sms/send.asp" method="post">

<b>�q�����</b><br>
���� <select name="GROUP2" onchange="selectgroup('reporters',this);">
<option value="-1">=====</option>
<option value="0">None</option>
<%
   // GROUPS
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM reportergroups WHERE COMPANYID='"+company_id+"' ORDER BY NAME");
   obj.NewTemplate(SitePath+"reporters\\groups\\option.wet");
   obj.Generate(0,0);
%>
</select>
<br>
<%
   // REPORTERS
   obj.ClearAll();
   obj.NewQuery("SELECT ID, GROUPID, NAME, SMSPHONE FROM reporters WHERE SMSPHONE!='' AND COMPANYID='"+company_id+"' ORDER BY NAME");
   obj.NewTemplate(SitePath+"sms\\reporters.wet");
   obj.Generate(0,0);
%>
<br>
<br>
<b>�q�T��</b> [<a href="l.asp?P=contacts&SP=add">�W�[</a>]<br>
���� <select name="GROUP" onchange="selectgroup('dest',this);">
<option value="-1">=====</option>
<option value="0">None</option>
<%
   // GROUPS
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM contactgroups WHERE MEMBERID='"+id+"' ORDER BY NAME");
   obj.NewTemplate(SitePath+"contacts\\groups\\option.wet");
   obj.Generate(0,0);
%>
</select> [<a href="l.asp?P=contacts&SP=groups&SP2=add">�W�[</a>]
<br>
<%
   // CONTACTS
   obj.ClearAll();
   obj.NewQuery("SELECT * FROM CONTACTS WHERE MEMBERID='"+id+"' AND SMSPHONE!='' ORDER BY NAME");
   obj.NewTemplate(SitePath+"sms\\list.wet");
   obj.Generate(0,0);
%>
<br>
<br>

<b>�q�ܸ��X</b> (�@��@��):</b><br>
<textarea name="BULK" cols="50" rows="3"></textarea><br>
<br>
<b>����:</b><br>
<textarea onkeyup="CheckLength(document.sms.TYPE.value)" name="MESS" cols="50" rows="5">


<%=GetSession("PHONENAME")%>
</textarea><input type="text" name="nbchars" size="4" value="---" disabled><br>
<%
   if(smshnid!=10 && smsleft=="0" && last24 >=5) Response.Write("<strong>0 �ѤU����</strong><br>");
   else {
%>
<input type="hidden" value="0" name="UsingTiming">
<input type="hidden" name="SendDate" value="<%=MyNow(1)%>">
<!--
<input type="radio" value="0" name="UsingTiming" checked> �ߧY�ǰe<br>
<input type="radio" value="1" name="UsingTiming"> �w���ǰe <input type="text" name="SendDate" value="<%=MyNow(1)%>"><br>
-->
����: <select name="TYPE" onchange="CheckLength(this.value)">
<option value="0">�۶O�� (�S���s�i)</option>
<option value="1" <%if(smsleft==0) Response.Write("selected")%> disabled>�K�O��</option>
</select><br>
<strong>
�y�۶O²�T�z�̦h�u���J�i���^��70�Ӧr�έ^��160�Ӧr�j<br>
�y�K�O²�T�z�̦h�u���J�i31�Ӧr�j<br>
</strong>
<input type="button" onclick="sendsms()" class="button" value="�e�X"><br>
<%
   }
   var s = String(Request("S"));
   if(s=="1") Response.Write("<strong>Message sent !</strong><br><br>");
   //if(s=="2") Response.Write("<strong>0�ѤU����</strong><br><br>");
%>
</form>
<br>
<a name="msg"></a>
<b>�Ӿ�:</b><br>
<br>
<!-- <img src="images/bul1.gif"> <a href="sms/trackall.asp">��s�Ҧ������A</a>-->
<!-- <img src="images/bul1.gif"> <a onclick="if(!confirm('Are you sure ?')) return false" href="sms/deletebad.asp">�R�������D������</a>-->
<img src="images/bul1.gif"> <a onclick="if(!confirm('Are you sure ?')) return false" href="sms/deletesucc.asp">�R���w���쪺����</a><br>
<table BGCOLOR="#000000" cellpadding="3" cellspacing="1">
<tr style="font-weight:bold;" bgcolor="#DDAA00">
<td>�q�ܸ��X</td>
<td>���</td>
<td>����</td>
<td>���A</td>
</tr>
<%
      var now = MyNow(1);

      obj.ClearAll();
      obj.NewQuery("SELECT TOP 20 * FROM sms WHERE MEMBERID='"+GetSession("PHONEID")+"' AND DELETED=0 ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"sms\\tree.wet");

      obj.Generate(0,0);
%>
</table>
<br>
