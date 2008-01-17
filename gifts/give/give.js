   //============================
	function get_mac_opt(id) {
		//alert("id="+id);
		for(i=0;i<options.length;i++)
			 if (options[i][0]==id) return options[i][1]
		return -1	 
		}
	
	
   function display_mac(id) {
		//alert(id)
		if(String(id)!="undefined") {
			show_hide_mac(id)
		   return
			}
		// else all field
		for(i=0;i<=4;i++) if(options[i]) show_hide_mac((i+6))
		}

	function show_hide_mac(id) {
		sel = g("g"+id);
		if(get_mac_opt(sel.options[sel.selectedIndex].value)==2) g("tdmac"+id).style.display = 'inline';
		else g("tdmac"+id).style.display = 'none';
		}	
		
   //============================
   function ontextkup(e) {
      if(e.keyCode=="13") {
         checkrecord();
         return false;
         }
      }

   //============================
   function sendform() {
      var r  = document.getElementById("sendform_result");
      r.innerHTML = "";
      document.getElementById("info").style.display = "none";
      document.getElementById("checkrecord_result").innerHTML = "";
      if(!checkAll()) {
         r.innerHTML = "<strong>輸入資料錯誤</strong>";
         Effect.Pulsate(r);
         return false;
         }
      checkrecord_submit();
      }

   //============================
   function delrecord_setresult(s) {
      g("delresults").innerHTML = unescape(s);
      getgifts("normal");
      }
   //============================
   function delrecord_setresult2(s) {
      g("delresults").innerHTML = "";
      setstatus("<b>資料已刪除</b>");
      }

   //============================
   function senddelform() {
      setstatus("請稍候...");
      var date  = document.getElementById("date").value;
      if(!vdate(date)) return;
      var team  = document.getElementById("team").value;
      var phone = document.getElementById("phone").value;
      majax.get("gifts/js/getdelrecords.asp?D="+date+"&T="+team+"&P="+phone,delrecord_setresult);
      }

   //============================
   function delconfirmed(list) {
      if(list!="") majax.get("gifts/js/delrecords.asp?IDS="+list,delrecord_setresult2);
      }


   //============================
   function checkAll() {
      // return true if all is OK, false if the form can not be sent
      var i;
      var rv = true;
      var nb = 0;
      for(i=1; i <= 10; ++i) {
         var r = checknb(document.getElementById("nb"+i));
         if(r==-1) rv = false;
         else if(r>0) ++nb;
         }
      if(!rv) return false;
      if(nb==0) return false;
      return true;
      }

   //============================
   function checknb(i) {
      // set the color
      // returns -1 if error, 0 if value == "0", else returns 1
      if(i.value=="0") {
         i.style.backgroundColor = "#888888";
         return 0;
         }
      else if(i.value!=String(parseInt(i.value))) {
         i.style.backgroundColor = "#FFAAAA";
         return -1;
         }
      else {
         i.style.backgroundColor = "#AAFFAA";
         return true;
         }
      }

   //============================
   function checkrecord_setresult(b) {
      //alert(unescape(b));
      setstatus("&nbsp;");
      var r  = document.getElementById("checkrecord_result");
      if(b=="+1") r.innerHTML = "<strong>資料存在但是結果不是『竣工』、『障礙』、『修復』</strong>";
      else if(b!="") r.innerHTML = "<b>OK</b>";
      else  r.innerHTML = "<strong>資料不存在</strong>";
      Effect.Pulsate(r);
      if (b!="" && b!="+1") return true;
      document.getElementById("phone").focus();
      return false;
      }

   //============================
   function DisplayGiftsForID_d(table) {

      //alert(table);
      var info = document.getElementById("info");
      info.innerHTML = unescape(unescape(table));
      Effect.Appear(info);
      getgifts("normal");

      }

   //============================
   function sendform_setresult(b) {
		b = String(b)
      setstatus("&nbsp;");
      document.getElementById("checkrecord_result").value="";
      var r  = document.getElementById("sendform_result");
      if(b=="0") r.innerHTML = "<b>資料已儲存</b>";
      else  {
         r.innerHTML = "<strong>錯誤: 資料存在</strong> "+b;
         //majax.get("gifts/js/display.asp?V="+b,DisplayGiftsForID_d);
         }
      Effect.Pulsate(r);
      var p = document.getElementById("phone");
      p.focus();
      if (b=="0") {
         p.value = "";
         return true;
         }
      return false;
      }

   //============================
   function checkrecord_submit_setresult(b) {
		var r  = document.getElementById("checkrecord_result");
		if(!checkrecord_setresult(b)) return;
		// create giftid and nb strings
		var g = new Array, n = new Array, m = new Array;
		for(i=1; i <= 10; ++i) {
			g[i-1] = document.getElementById("g"+i).value;
			n[i-1] = document.getElementById("nb"+i).value;
			e = document.getElementById("mac"+i)
			if(e) m[i-1] = e.value;
			else  m[i-1] = "none";
			}
		majax.get("gifts/js/insert.asp?V="+b+"&G="+String(g)+"&N="+String(n)+"&M="+String(m),sendform_setresult);
		}

   //============================
   function vdate(date) {
      if(!isValidDate(date)) {
         var r = document.getElementById("checkrecord_result");
         r.innerHTML = "<strong>Bad date</strong>";
         Effect.Pulsate(r);
         setstatus("&nbsp;");
         return false;
         }
      return true;
      }

   //============================
   function checkrecord() {
      setstatus("請稍候...");
      var date  = document.getElementById("date").value;
      if(!vdate(date)) return;
      var team  = document.getElementById("team").value;
      var phone = document.getElementById("phone").value;
      majax.get("gifts/js/checkrecord.asp?D="+date+"&T="+team+"&P="+phone,checkrecord_setresult);
      }


   //============================
   function checkrecord_submit() {
      setstatus("請稍候...");
      var date  = document.getElementById("date").value;
      if(!vdate(date)) return;
      var team  = document.getElementById("team").value;
      var phone = document.getElementById("phone").value;
      majax.get("gifts/js/checkrecord.asp?D="+date+"&T="+team+"&P="+phone,checkrecord_submit_setresult);
      }
