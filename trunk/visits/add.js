function setstatus(s) {
   var st = document.getElementById("status");
   if(!st) alert("no status id found on this page\nMsg was: "+s);
   else st.innerHTML = s;
   }

function lastdata_result(s) {
	$("lastdata").innerHTML = unescape(unescape(s));
	}
   
function submit_result(s) {
	if(s=="1") {
		setstatus("<font color=red><b>OK</b></font>");
		document.addform.SERIAL.value = "";
		document.addform.PHONE.value = "";
		document.addform.AMPM.value = "";
		document.addform.SERIAL.focus();
		//majax.get("visits/cgetlastdata.asp",lastdata_result);
		}
	else if(s=="2") setstatus("<font size=4 color=red><strong>���~: ����M�q�ܭ���</strong></font><br>");
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

	setstatus("�еy��...");
	majax.get("visits/add2.asp?"+getformdata(document.addform),submit_result);
	
	}

function verify () {

   var form = document.addform;
   if(!checkNull(form.ZONE,"�a��")) return false;
   if(!checkNull(form.RESPONSIBLE,"��J��")) return false;
   if(!checkNull(form.DATE,"���")) return false;
   if(!checkNull(form.ZONE,"�a��")) return false;
   if(!checkNull(form.TEAM,"�Z�O")) return false;
   if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}

   if(!checkNull(form.SERIAL,"�p��")) return false;
   if(form.SERIAL.value.length < 12) {
      if(!confirm("���`�I���ˬd�O�_��J�p�楿�T\n�����T������")) return false;
      }

		if(!checkNull(form.PHONE,"�q��")) return false;
   if((form.PHONE.value.indexOf(/[-a-z]/)>-1 || form.PHONE.value.length < 8)) {
      if(!confirm("���`�I���ˬd�O�_��J�q�ܥ��T\n�����T������")) return false;
      }
	submit();
	return true;
   
   }
	
function catchKey(event,object) {
   var form = document.addform;
   //alert(object.name);
	var phone_len  = 8;
	var serial_len = 12;
	if(form.JOBTYPE.value == 6 || form.JOBTYPE.value == 7) {
		phone_len  = 10;
		serial_len = 11;
		}
	var k = event.keyCode;
	if(k==16 || k==9 || k==8 || k==46 || k==37 || k==39 || k==18 || k==116 || k==35 ||  k==36) return; // Shift, Tab, backspace, del, <, >, Alt, F5, end, home
	//setstatus(k);
   switch(object.name) {
      case "SERIAL" :
         if(String(object.value).length == serial_len) {
            form.PHONE.focus();
            return false;
            }
         break;
      case "PHONE" :
         if(String(object.value).length == phone_len) {
            form.AMPM.focus();
            return false;
				}
         break;
      case "AMPM" : 
			if(String(object.value).length == 2 || event.keyCode==13) {
            verify();
            return false;
            }
			break;
      }
    return true;
    }
	 