<%
   var result = String(Request("R"));
   obj.ClearAll();
   var team;
   if(admin=="4") team = GetSession("PHONECODE");
   else team = und(GetSession("editresultteam"));
   var date = und(GetSession("editresultdate"));
%>

<script language="javascript">
	
	
	function submit_result(s) {
		s = unescape(s);
		if(String(parseInt(s))==s) {
			setstatus("���F"+s+"�ӰO��");
			document.addform.PHONE.value = "";
			}
		else setstatus("<strong>"+s+"</strong>")

		}
	
	function getformdata(f) {
		var s = "";
		var n;
		for(i=0;i<f.elements.length;i++) {
			n = f.elements[i].name;
			if(n!="")
	         s += n+"="+f.elements[i].value+"&";
			}
		return s;
		}
	function setstatus(s) {
	   var st = document.getElementById("status");
	   if(!st) alert("no status id found on this page\nMsg was: "+s);
	   else st.innerHTML = s;
	   }

	function submit() {
		setstatus("�еy��...");
		majax.get("visits/editr/edit.asp?"+getformdata(document.addform),submit_result);
		}
   function vereditr () {

      f = document.addform;
      if(f.team && !checkNull(f.team,'�Z�O')) return;
      if(f.date && !checkNull(f.date,'���')) return;
      if(f.phone && !checkNull(f.phone,'�q��')) return;
      submit();

      }

   function catchKey(event,object) {

      if(event.keyCode==13) vereditr();
      return false;

      }


</script>

<b><%=result%>����</b><br>
<br>
<form name="addform" action="visits/editr/edit.asp" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<%if(result!="�״_") {
%>
<tr><td  class="a90">�Z�O�G</td><td class="a90"><input type="text" name="team" value="<%=team%>"  <%if(admin=="4") Response.Write("readonly");%> class="a90" style="height:14pt"></td></tr>
<tr><td  class="a90">����G</td><td class="a90"><input type="text" name="date" value="<%=date%>"  class="a90" style="height:14pt">  [ <a href="#" onclick="addform.date.value = MyNow(0);">����</a> ]</td></tr>
<%} else {
   var phone = und(Request("PH"));
   }
%>


<tr>
<td class="a90">�q�ܸ��X�G</td><td class="a90"><input type="text" id="phone" name="phone"
<%
   if(result=="���u" || result=="��u" || result=="�j��") {
%>
      onkeydown="catchKey(event,this)"
<%
   }
%>
value="<%=phone%>"  class="a90" style="height:14pt"></td>
</tr>



<%
   if(result=="�h��") {
%>
<tr><td class="a90">�h���]�G</td><td class="a90"><select name="reason">
<%
   obj.NewQuery("SELECT * FROM cancel WHERE NEW=1 ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
   obj.Generate(0,0);
%>
</select></td></tr>
<%
   }
   else if(result=="�A��") {
%>
<tr><td class="a90">�A����]�G</td><td class="a90"><select name="reason">
<%
   obj.NewQuery("SELECT * FROM dispatch ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
   obj.Generate(0,0);
%>
</select></td></tr>
<%
   }
   else if(result=="���P") {
%>
<tr><td class="a90">���P��]�G</td><td class="a90"><select name="reason">
<%
   obj.NewQuery("SELECT * FROM reporters ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
   obj.Generate(0,0);
%>
</select></td></tr>
<%
   }
   else if(result=="�״_") {
%>
<tr><td class="a90">�״_��]�G</td><td class="a90"><select name="reason">
<%
   obj.NewQuery("SELECT * FROM repair ORDER BY CODE");
   obj.NewTemplate(SitePath+"codename.wet");
   obj.Generate(0,0);
%>
</select></td></tr>
<tr><td class="a90">�״_����G</td><td><input type="text" name="repairdate" value="<%=MyNow(1)%>"></td></tr>
<%
   }
   if(result!="���u" && result!="�j��" && result!="��u") {
%>
<tr><td class="a90">�Ƶ��G</td><td class="a90"><textarea name="memo" cols="50" rows="3"></textarea></td></tr>
<%}%>
<tr><td class="a90">&nbsp;</td><td class="a90"><input class="button" type="button" onclick="vereditr()" value=" �s�@�� "  class="a90" style="height:14pt"></td></tr>
</table>
<input type="hidden" name="result" value="<%=result%>">
</form>

<div id="status"></div>

<%
   var e = String(Request("E"));
   if(e=="1") {
      var nb = String(Request("NB"));
%>
      <strong>���F<%=nb%>�ӰO��</strong><br>
      <br>
<%
      }
%>



<%

   switch(sp2.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!-- include file="ctree.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp2%></B>)<br>
<%
	}
%>

