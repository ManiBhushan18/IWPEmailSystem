<%@ page import="java.sql.*,pack.DemoConnect1" %>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>
<%	
		boolean valid=false;
	
		String email1=(String)session.getAttribute("email");
		int mid= Integer.parseInt(request.getParameter("mid"));
		String status1="true";
		try
		{
			Class.forName(DemoConnect1.driver);
			con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
			ps=con.prepareStatement("update sentdetail set status=? where from1=? and messid=?");
			ps.setString(1,status1);
			ps.setString(2,email1);
			ps.setInt(3,mid);
			ps.executeUpdate();
			
			ps=con.prepareStatement("select * from sentdetail where from1=? and messid=?");
			ps.setString(1,email1);
			ps.setInt(2,mid);
			rs=ps.executeQuery();
			rs.next();
%>
<form method="POST" action="reply.jsp">
	<table width="730" cellspacing="0" cellpadding="0" >
		<tr><td align="left" width="142"> <b><font size="4" color="#0000CC">To</font></font></b></td>
			<td width="588"><%= rs.getString("to1") %></td></tr>
		<tr><td align="left" width="142"> <b><font size="4" color="#0000CC">Subject</font></font></b></td>
			<td width="588"><%= rs.getString("subject") %></td></tr>
		<tr><td align="left" width="142"> <b><font color="#0000CC">
			<font size="4">Date</font></font></font></b></td>
			<td width="588"><%= rs.getString("date") %></td>
		<tr><td align="left" width="142"><font color="#0000CC" size="4"><b> Attachment</b></font></font></td>
			<td width="588"><%= rs.getString("file1") %></td>			
		</tr>
		<tr><td align="left" colspan=2><font color="#006600" size="4">
			<span style="font-weight: 700; background-color: #99FFCC">Message</span></font></td></tr>
	<tr >	
			
			<td colspan=2><pre><%= rs.getString("message") %></pre></td>
			
			</tr>		
			
				

	<tr><td colspan=4><font size="4">
		<input type="submit" value="Reply" name="B1" style="font-weight: 700; background-color: #66FF33"></font></td></tr>
	</table>
				</form>
<%				
			
		}
		catch(Exception e)
		{
			out.print(e);
		}
%>




