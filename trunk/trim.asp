<%
String.prototype.LTrim = new Function("return this.replace(/^\s+/,'')")
String.prototype.RTrim = new Function("return this.replace(/\s+$/,'')")
String.prototype.Trim  = new Function("return this.replace(/^\s+|\s+$/g,'')")
%>
