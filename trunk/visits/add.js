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
   switch(object.name) {
      case "SERIAL" :
         if(String(object.value).length == 11) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value += String.fromCharCode(event.keyCode);
            event.returnValue = false;
            form.PHONE.focus();
            return false;
            }
         break;
      case "PHONE" :
         if(String(object.value).length == 7) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value = String(object.value) + String.fromCharCode(event.keyCode);
            //alert("��:"+event.keyCode);
            form.AMPM.focus();
            event.returnValue = false;
            return false;
            }
         break;
      case "AMPM" : 
         /*
			if(String(object.value).length == 1) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value += String.fromCharCode(event.keyCode);
            verify();
            event.returnValue = false;
            return false;
            }
			*/
			if(event.keyCode==13) verify(); return false;
			break;
      }
      
    return true;
    
    }