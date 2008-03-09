function setstatus(s) {
   var st = document.getElementById("status");
   if(!st) alert("no status id found on this page\nMsg was: "+s);
   else st.innerHTML = s;
   }

function lastdata_result(s) {
	document.getElementById("lastdata").innerHTML = unescape(unescape(s));
	}
   
function submit_result(s) {
	if(s=="1") {
		setstatus("<font color=red><b>OK</b></font>");
		//majax.get("visits/cgetlastdata.asp",lastdata_result);
		document.addform.SERIAL.value = "";
		document.addform.PHONE.value = "";
		document.addform.AMPM.value = "";
		document.addform.SERIAL.focus();
		}
	else if(s=="2") setstatus("<font size=4 color=red><strong>錯誤: 日期和電話重複</strong></font><br>");
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
	//alert(s);
	return s;

	}
	
function submit() {
	
	//setstatus(getformdata(document.addform));
	//return;

	setstatus("請稍候...");
	majax.get("visits/add2.asp?"+getformdata(document.addform),submit_result);
	
	}

function verify () {

   var form = document.addform;
   if(!checkNull(form.ZONE,"地區")) return false;
   if(!checkNull(form.RESPONSIBLE,"輸入員")) return false;
   if(!checkNull(form.DATE,"日期")) return false;
   if(!checkNull(form.ZONE,"地區")) return false;
   if(!checkNull(form.TEAM,"班別")) return false;
   if(String(parseInt(form.TEAM.value))=="NaN") {alert('班別錯誤');return false;}

   if(!checkNull(form.SERIAL,"聯單")) return false;
   if(form.SERIAL.value.length < 12) {
      if(!confirm("異常！請檢查是否輸入聯單正確\n不正確按取消")) return false;
      }

		if(!checkNull(form.PHONE,"電話")) return false;
   if((form.PHONE.value.indexOf(/[-a-z]/)>-1 || form.PHONE.value.length < 8)) {
      if(!confirm("異常！請檢查是否輸入電話正確\n不正確按取消")) return false;
      }
	submit();
	return true;
   
   }

function catchKey(event,object) {
   var form = document.addform;
   //alert(object.name);
	var phone_len = 8;
	if(form.JOBTYPE.value == 6 || form.JOBTYPE.value == 7)
		phone_len = 12;
	var k = event.keyCode;
	if(k == 9 || k == 8 || k == 46 || k==37 || k==39 || k==18 || k==116) return; // Tab, backspace, del, <, >, Alt, F5
	//alert(k);
   switch(object.name) {
      case "SERIAL" :
         if(String(object.value).length == 12) {
            if(k >= 96) k -= 48;
            //object.value += String.fromCharCode(k);
            event.returnValue = false;
            form.PHONE.focus();
            return false;
            }
         break;
      case "PHONE" :
         if(String(object.value).length == phone_len) {
            if(k >= 96) k -= 48;
            //object.value += String.fromCharCode(k);
            form.AMPM.focus();
            event.returnValue = false;
            return false;
				}
         break;
      case "AMPM" : 
			if(String(object.value).length == 1) {
            if(k >= 96) k -= 48;
            //object.value += String.fromCharCode(k);
            verify();
            event.returnValue = false;
            return false;
            }
			if(event.keyCode==13) {
				verify();
				return false;
				}
			break;
      }
      
    return true;
    
    }