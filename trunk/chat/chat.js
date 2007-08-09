	var majax = new Majax();
   majax.setBaseUrl("http://192.168.0.1/PhoneSystem/Chat/");
   //majax.setBaseUrl("http://phones.easyplay.com.tw/Chat/");
   var refreshtime = 5*1000;
   var nbmaxrefresh = (10*60*1000)/refreshtime;   // 10 minutes
   var nbrefresh = nbmaxrefresh;
   var autostopped = "Automatic refresh stopped. Hit F5 or write a msg to refresh the page...";

   function g(s) {return document.getElementById(s);}

   function enc(str) {
      //str = String(field.value);
      var rv = "";
      for(var i=0; i < str.length;i++) {
         if(str.charCodeAt(i)>127) rv += "&#" + String(str.charCodeAt(i)) + ";";
         else rv += str.charAt(i);
         }
      return rv;
      }

	function setstatus(s) {
      g("status").innerHTML = s;
      roundstatus();
	   }

	function setresult(s) {
	   if(s[0]!="0") {
	         g("result").innerHTML = "Please login...";
	         }
      else {
         g("result").innerHTML = unescape(s);
         }
      roundresult();
      g("refresh").src = "images/bk.gif";
	   }

	function setupdateresult(s) {
	   setresult(s);
      if(nbrefresh==0) setTimeout( "refresh()", refreshtime );
      nbrefresh = nbmaxrefresh;
	   setstatus("&nbsp;");
	   }


	function add() {
   	var n = g("name");
      var t = g("text");
	   if(n.value=="") {setstatus("<strong>Please enter your name...</strong>");n.focus();return;}
	   if(t.value=="") {setstatus("<strong>Please enter some text...</strong>");t.focus();return;}
      setstatus("<b>Updating...</b>");
	   majax.get("add.asp?N="+escape(enc(n.value))+"&T="+escape(enc(t.value)), setupdateresult);
	   t.value = "";
	   t.focus();
	   }
   function roundresult() {
      if(!NiftyCheck()) return;
   	Rounded("div#result","#FFF","#DDEEFF");
   	}

   function roundstatus() {
      if(!NiftyCheck()) return;
   	Rounded("div#status","#FFF","#FFDDAA");
      }
   function round() {
      roundstatus();
      roundresult();
   }

   function ontextkup(e) {
      if(e.keyCode=="13") {
            add();
            return false;
            }
      }

   function refresh() {
      g("refresh").src = "images/refresh.gif";
	   majax.get("refresh.asp", setresult);
   	if(--nbrefresh > 0) setTimeout( "refresh()", refreshtime );
   	else setstatus(autostopped);
      }
