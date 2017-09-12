<%
String searchval = request.getParameter("textbox1");
String url = "http://www.google.com/search?q="+searchval;
out.println(url);
response.sendRedirect(url);
%>
