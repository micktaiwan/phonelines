<%
   var maintable  = GetSession("AJAX_MAINTABLE");
   var sectable   = GetSession("AJAX_SECTABLE");
   var name       = GetSession("AJAX_NAME");
   
   // Set defaults
   if(maintable=="undefined" || sectable=="undefined") {
      maintable="gifts"
      Session("AJAX_MAINTABLE") = "gifts";
      sectable="giftgiven"
      Session("AJAX_SECTABLE") = "giftgiven";
      name="�ث~"
      Session("AJAX_NAME") = "�ث~";
      }
%>
