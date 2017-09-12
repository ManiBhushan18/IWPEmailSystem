<%@ page import="java.sql.*,pack.DemoConnect1" %>
<%!
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
%>
<%	
		boolean valid=false;
	
		String email1=(String)session.getAttribute("email");
		String cbox[]=request.getParameterValues("C1");
		if(cbox.length<0 || cbox==null)
		{
			out.print("plz select atleast one message");
%>
			<jsp:include page="trash.jsp" />
<%			
		}
		else
		{
			try
			{
				Class.forName(DemoConnect1.driver);
				con=DriverManager.getConnection(DemoConnect1.connect,DemoConnect1.login,DemoConnect1.pwd);
				for(int i=0;i<cbox.length;i++)
				{
					ps=con.prepareStatement("delete from trash where to1=? and messid=?");
					ps.setString(1,email1);
					ps.setInt(2,Integer.parseInt(cbox[i]));
					ps.executeUpdate();
				}	
				
%>
	<jsp:forward page="trash.jsp" />
<%				
				
			}
	
		catch(Exception e)
		{
			out.print(e);
		}
		}
%>
