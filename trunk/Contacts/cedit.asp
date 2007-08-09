<SCRIPT language="JavaScript">

function verifymeform() {

   var sms = document.meform.smsphone;
 	if (sms.value != '' && sms.value.length != 10) {
		alert("SMS phone number must 10 chars long.\nEnter no spaces or other signs but digits.\nOnly Taiwanese cell phone numbers are allowed.");
		sms.focus();
		return(false);
		}

   document.meform.submit();

   }

</SCRIPT>

<%
   var k = String(Request("K"));

   obj.ClearAll();
   obj.NewQuery("SELECT * FROM contacts WHERE ID='"+k+"'");
   obj.NewTemplate(SitePath+"contacts\\Edit.wet");
   obj.NewQuery("SELECT * FROM contactgroups WHERE MEMBERID='"+id+"'");
   obj.NewTemplate(SitePath+"contacts\\groups\\option.wet");
   obj.DirectResponse = 0;
   obj.Generate(0,0);
%>
