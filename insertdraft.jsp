<%@ page import="java.sql.*,pack.DemoConnect,java.util.Date" %>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>	
	<%
		boolean valid=false;
		
		String from1=(String)session.getAttribute("email");
		String to1=request.getParameter("to1");
		String subject=request.getParameter("subject");
		String message=request.getParameter("message");
		String file1=request.getParameter("file1");
		Date d = new Date();
		String status="false";
		 String dd=d.getDate()+"/"+(d.getMonth()+1)+"/"+(d.getYear()+1900)+", "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		try
		{
			con=DemoConnect.getConnection();
			ps=con.prepareStatement("insert into draft(to1,from1,subject,message,date,status,file1) values( ?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1,to1);
			ps.setString(2,from1);
			ps.setString(3,subject);
			ps.setString(4,message);
			ps.setString(5,dd);
			ps.setString(6,status);
			ps.setString(7,file1);
			ps.executeUpdate();	
			con.close();
%>
			<html><div style="position:absolute;top:200px;left:200px"><font color=blue><b>email successfully sent to draft <%= to1 %></b></font></div></html>
			<jsp:include page="maininbox.jsp" />
<%		
		 
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
