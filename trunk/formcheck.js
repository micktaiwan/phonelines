function checkYear(field) {
	if (field.value.length == 0) {
		alert("���(�~)����줣�i�ťաI");
		field.focus();
		return(false);
		}

   var v = parseInt(field.value);
	if (String(v)=="NaN" || v < 85 || v > 100) {
		alert("���(�~)����쥲������86 - 99����");
		field.focus();
		return(false);
		}
	return(true);
	}

function checkMonth(field) {
	if (field.value.length == 0) {
		alert("���(��)����줣�i�ťաI");
		field.focus();
		return(false);
		}
   var v = parseInt(field.value);
	if (String(v)=="NaN" || v < 1 || v > 12) {
		alert("���(��)����쥲������1 - 12����");
		field.focus();
		return(false);
		}
	return(true);
	}

function check_day(field) {
	if (field.value.length == 0) {
		alert("���(��)����줣�i�ťաI");
		field.focus();
		return(false);
		}
	if (field.value < 1 || field.value > 31) {
		alert("���(��)����쥲������1 - 31����");
		field.focus();
		return(false);
		}
	return(true);
	}

function check_date(fyear, fmonth, fday, tyear, tmonth, tday) {
	if (tyear.value < fyear.value) {
		alert("�_�l������i�j��פ����I");
		fyear.focus();
		return(false);
		}
	if ((tyear.value == fyear.value) && (tmonth.value < fmonth.value)) {
		alert("�_�l������i�j��פ����I");
		fmonth.focus();
		return(false);
		}
	if ((tyear.value == fyear.value) && (tmonth.value == fmonth.value) & (tday.value < fday.value)) {
		alert("�_�l������i�j��פ����I");
		fday.focus();
		return(false);
		}
	return(true);
	}

function checkNull(field, str) {
	if (field.value.length == 0) {
		alert(str + "��줣�i�ť�!");
		field.focus();
		return(false);
		}
	return(true);
   }


function checkID(field) {
	if (field.value.length < 10) {
		alert("�����Ҹ�����!");
		field.focus();
		return(false);
		}
	return(true);
   }

function checkEmail(field) {
	if (field.value.indexOf("@")==-1 || field.value.indexOf(".")==-1) {
		alert("�q�l�H�c����!");
		field.focus();
		return(false);
		}
	return(true);
}

function checkPass(f1,f2) {
   if(!checkNull(f1,"�n�J�K�X")) return false;
	if (f1.value != f2.value) {
		alert("�T�{�K�X����!");
		f2.focus();
		return(false);
		}
	return(true);
	}

function checkRadio(f,str) {

   var ok = false;
   for (i=0, n = f.length; i<n; i++) {
      if (f[i].checked) {
         ok = true;
         break;
         }
      }
   if (!ok) {
		alert(str);
		return(false);
		}
	return(true);

}

function checkNumber(field) {
	if (field.value.length == 0) return true;

   var v = parseInt(field.value);
	if (String(v)=="NaN") {
		alert("�Ʀr���");
		field.focus();
		return(false);
		}
	return(true);
	}

