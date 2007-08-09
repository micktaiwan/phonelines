function checkYear(field) {
	if (field.value.length == 0) {
		alert("日期(年)的欄位不可空白！");
		field.focus();
		return(false);
		}

   var v = parseInt(field.value);
	if (String(v)=="NaN" || v < 85 || v > 100) {
		alert("日期(年)的欄位必須介於86 - 99之間");
		field.focus();
		return(false);
		}
	return(true);
	}

function checkMonth(field) {
	if (field.value.length == 0) {
		alert("日期(月)的欄位不可空白！");
		field.focus();
		return(false);
		}
   var v = parseInt(field.value);
	if (String(v)=="NaN" || v < 1 || v > 12) {
		alert("日期(月)的欄位必須介於1 - 12之間");
		field.focus();
		return(false);
		}
	return(true);
	}

function check_day(field) {
	if (field.value.length == 0) {
		alert("日期(日)的欄位不可空白！");
		field.focus();
		return(false);
		}
	if (field.value < 1 || field.value > 31) {
		alert("日期(日)的欄位必須介於1 - 31之間");
		field.focus();
		return(false);
		}
	return(true);
	}

function check_date(fyear, fmonth, fday, tyear, tmonth, tday) {
	if (tyear.value < fyear.value) {
		alert("起始日期不可大於終止日期！");
		fyear.focus();
		return(false);
		}
	if ((tyear.value == fyear.value) && (tmonth.value < fmonth.value)) {
		alert("起始日期不可大於終止日期！");
		fmonth.focus();
		return(false);
		}
	if ((tyear.value == fyear.value) && (tmonth.value == fmonth.value) & (tday.value < fday.value)) {
		alert("起始日期不可大於終止日期！");
		fday.focus();
		return(false);
		}
	return(true);
	}

function checkNull(field, str) {
	if (field.value.length == 0) {
		alert(str + "欄位不可空白!");
		field.focus();
		return(false);
		}
	return(true);
   }


function checkID(field) {
	if (field.value.length < 10) {
		alert("身分證號不對!");
		field.focus();
		return(false);
		}
	return(true);
   }

function checkEmail(field) {
	if (field.value.indexOf("@")==-1 || field.value.indexOf(".")==-1) {
		alert("電子信箱不對!");
		field.focus();
		return(false);
		}
	return(true);
}

function checkPass(f1,f2) {
   if(!checkNull(f1,"登入密碼")) return false;
	if (f1.value != f2.value) {
		alert("確認密碼不對!");
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
		alert("數字欄位");
		field.focus();
		return(false);
		}
	return(true);
	}

