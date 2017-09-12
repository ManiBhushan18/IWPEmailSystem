<%@ page import="java.sql.*,pack.DemoConnect1" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>New Page 1</title>
</head>

<body>

<table border="0" width="184" height="293">
	<tr>
		<td height="22" width="184" align="left"><b><a href="compose.jsp">
		<font size="4">Compose</font></a></b></td>
	</tr>
	<tr>
		<td height="32" width="184" align="left"><b><a href="inbox.jsp">
		<font size="4">Inbox</font></a><font size="4">
		<%
			Connection con;
	PreparedStatement ps;
	ResultSet rs;
			String to1=(String)session.getAttribute("email");
			
			String status="false";
			try
			{
				Class.forName(DemoConnect1.driver);
				con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
				ps=con.prepareStatement("select count(status) from messdetail where to1=? and status=?");
				ps.setString(1,to1);
				ps.setString(2,status);
				rs=ps.executeQuery();
				rs.next();
		%>
		<font color="#0000FF">(<%= rs.getString(1) %>)</font></font></b>	
		
			<%
			}
			catch(Exception e)
			{
				
			}			
		
		%>
		
		</td>
	</tr>
	<tr>
		<td height="30" width="184" align="left"><b><a href="draft.jsp"><font size="4">Draft</font></a></b></td>
	</tr>
	<tr>
		<td height="27" width="184" align="left"><b><a href="sent.jsp">
		<font size="4">Sent</font></a></b></td>
	</tr>
	<tr>
		<td height="27" width="184" align="left"><b><a href="trash.jsp">
		<font size="4">Trash</font></a></b></td>
	</tr>
	<tr>
		<td height="24" width="184">&nbsp;</td>
	</tr>
	<tr>
		<td height="24" width="184">&nbsp;</td>
	</tr>
	<tr>
		<td height="102" width="184">&nbsp;</td>
	</tr>
</table>

</body>

</html>
