<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>

<table border="0" width="1274" height="116">

	<tr>
		<td height="57" width="168">
		<p align="center"><font size="6" color="#0000FF"><b>IWP EMAIL SYSTEM</b></font></td>
		<td height="57" width="397">&nbsp;<p>&nbsp;</p>
		<p><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> <font size="3">
		
			<input type="text" name="textbox1" size="28" value="<%= "hello" %>" style="background-color: #3399FF"></font><b>
			<font color="#FF00FF">
			<input type="submit" value="Search" name="B3z" style="background-color: #3399FF; font-weight:700">
			<input type="reset" value="Web" name="B4" style="text-decoration: underline; background-color: #00FFFF; font-weight:700"></font></b></td>
		<td height="57" width="318">
		<font size="2">
		<%
		String email=(String)session.getAttribute("email");
		
		%>	
		<html></font><font color=blue><b><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></b></font><html><font color=blue><b><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img border="0" src="iwp.jpg" width="167" height="123">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
		</font> </b></font>
		<p><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;
		<html></font><font color=blue><b><font size="4">Welcome: Hello</font> <%=email %></b></font>
		
		</td>
		<td  height="57" width="343"><b><font size="2" color="#CC00FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><font color="#CC00FF">
		</font><a href="signout.jsp">
		<font size="4" color="#CC00FF">Sign out</font></a><font size="4" color="#CC00FF">
		</font>
		<font size="2" color="#CC00FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</font></b></td>
	<form method="POST" action="--WEBBOT-SELF--">
			<!--webbot bot="SaveResults" U-File="fpweb:///_private/form_results.csv" S-Format="TEXT/CSV" S-Label-Fields="TRUE" -->
			&nbsp;</form>
</table>
<body bgcolor="BFCF00">
</body>

</html>
