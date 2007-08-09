<html>
<body>
<b>Cookie list:</b><br>
<%
dim x,y

for each x in Request.Cookies
  if Request.Cookies(x).HasKeys then
    for each y in Request.Cookies(x)
      response.write(x & ":" & y & "=" & Request.Cookies(x)(y))
      response.write("<br />")
    next
  else
    Response.Write(x & "=" & Request.Cookies(x) & "<br />")
  end if
next
%></body>
</html>
