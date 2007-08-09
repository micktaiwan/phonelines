<SCRIPT language="JavaScript">

function verifymeform() {

   var name = document.meform.name;
 	if (name.value == '') {
		name.focus();
		return(false);
		}

   document.meform.submit();

   }

</SCRIPT>

<%
   var k = String(Request("K"));

   obj.ClearAll();
   obj.NewQuery("SELECT * FROM contactgroups WHERE ID="+k);
   obj.NewTemplate(SitePath+"contacts\\groups\\Edit.wet");
   obj.Generate(0,0);
%>
