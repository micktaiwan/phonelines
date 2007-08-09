<div id="status"></div>
Dates: <select onchange="get_zone(this.value)">
<option value="">=== Choose ===</option>
<%
	obj.ClearAll();
	obj.NewQuery("SELECT DISTINCT [FROM], [TO] FROM STATS WHERE [ROWCOUNT] > 0 ORDER BY [FROM] DESC");
	obj.NewTemplate(SitePath+"search\\stats\\dates.wet");
   obj.DirectResponse = 1;
	obj.Generate(0,0);
%>
</select><br>
Zones: <select id="zones" onchange="get_file(this.value)">
<option value="">=== Choose ===</option>
</select><br>
<br>
<div id='statable'>
</div>
<script type="text/javascript">
function setstatus(s) {
   var st = document.getElementById("status");
   if(!st) alert("no status id found on this page\nMsg was: "+s);
   else st.innerHTML = s;
   }
   
function get_zone(f) {
   if(f!="") {
      var obj = document.getElementById('zones');
      obj.options.length = 0;
      majax.get("search/stats/get_zones.asp?D="+f,display_zones);
      }
   }
function display_zones(str) {
   var obj = document.getElementById('zones');
   obj.options[obj.options.length] = new Option('=== Choose ===','');
   eval(str);
   }
   
function get_file(f) {
   if(f!="")
      majax.get("search/stats/"+f,display_row2);
   }
function display_row2(str) {
   t = document.getElementById('statable');
   t.innerHTML = str;
   }
</script>
